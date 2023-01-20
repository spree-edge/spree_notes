module Spree
  module Admin
    class NotesController < Spree::Admin::BaseController
      include ::Behaveable::ResourceFinder


      # Get notes.
      #
      # GET (/:noteable/:noteable_id)/notes(.:format)
      #
      def index
        @notes = noteable.order(created_at: :desc)
        render template: "spree/admin/#{context}/notes"
      end

      # Create a note.
      #
      # POST (/:noteable/:noteable_id)/notes(.:format)
      #
      def create
        note = noteable.new(notes_params)
        if note.save
          noteable << note if @behaveable
          flash[:success] = flash_message_for(note, :successfully_created)
        else
          flash[:error] = note.errors.full_messages.join(", ")
        end
        redirect_back(fallback_location: fallback_location)
      end

      # Delete a note.
      #
      # DELETE (/:notable/:noteable_id)/notes/:id(.:format)
      #
      def destroy
        note = noteable.find_by(id: params[:id])
        if note.destroy
          flash[:success] = flash_message_for(note, :successfully_removed)
        else
          flash[:error] = note.errors.full_messages.join(', ')
        end
        redirect_back(fallback_location: fallback_location)
      end

      def update
        note = noteable.find_by(id: params[:id])
        note.update(notes_params)

        flash[:success] = flash_message_for(note, :successfully_updated)
        redirect_back(fallback_location: fallback_location)
      end

      private

      # Get Spree::Note context object.
      #
      # ==== Returns
      # * <tt>ActiveRecord</tt> - Noteable's notes or Spree::Note.
      def noteable
        @behaveable ||= behaveable
        @behaveable ? @behaveable.notes : Spree::Note
      end

      # Sanitize request data.
      #
      # ==== Returns
      # * <tt>Hash</tt> - Sanitized request params.
      def notes_params
        params.require(:note).permit(:note, :user_id)
      end

      def fallback_location
        spree.polymorphic_path([:admin, @behaveable, Spree::Note])
      end

      def context
        @behaveable.class.table_name.split('_')[-1]
      end
    end
  end
end
