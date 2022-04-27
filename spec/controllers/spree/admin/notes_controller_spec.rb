require 'spec_helper'

module Spree
  module Admin
    describe NotesController, type: :controller do
      stub_authorization!

      before do
        SpreeNotes::Config[:noteables] = ['spree_orders', 'spree_products', 'spree_users']
      end

      let!(:klass) { ['order', 'product'].sample }
      let!(:behavable) { create(klass.to_sym) }
      let(:context) { behavable.class.table_name.split('_')[-1] }
      let!(:behavable_params) do
        {
          "#{klass}_id": behavable.to_param
        }
      end

      describe '#index' do
        subject do
          get :index, params: behavable_params
        end

        it 'returns 200 status' do
          expect(response.status).to eq 200
        end
      end

      describe '#destroy' do
        let!(:note) do
          behavable.notes.create!(note: "Dummy text", user_id: create(:user).id)
        end

        subject(:destroy) do
          params = behavable_params.merge(id: note.id)
          delete :destroy, params: params
        end

        context 'Note Destroyed!' do
          it 'returns 302 status' do
            destroy
            expect(response).to have_http_status(302)
          end

          it 'returns success flash response' do
            destroy
            expect(flash[:success]).to eq(Spree.t(:successfully_removed, resource: 'Note'))
          end

          it 'leaves error flash empty' do
            destroy
            expect(flash[:error]).to be_nil
          end
        end
      end

      describe '#create' do
        let!(:user) { create(:user) }

        subject(:create_note) do
          post :create, params: {
            note: { note: "Awesome!!", user_id: user.id },
            "#{klass}_id": behavable.to_param
          }
        end

        context 'Note Created!' do
          let!(:note) do
            behavable.notes.create!(note: "Dummy text", user_id: user.id)
          end

          it 'should creates a note' do
            expect do
              create_note
              expect(response).to have_http_status(302)
            end.to change(Spree::Note, :count).by(1)
          end
        end

        context "When note is not added" do
          it 'should not create note' do
            expect do
              post :create, params: {
                note: { user_id: user.id },
                "#{klass}_id": behavable.to_param
              }
              expect(flash[:error]).to eq("Note can't be blank")
              expect(response).to have_http_status(302)
            end.to change(Spree::Note, :count).by(0)
          end
        end
      end
    end
  end
end
