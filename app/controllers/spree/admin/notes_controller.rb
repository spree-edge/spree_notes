module Spree
  module Admin
    class NotesController < Spree::Admin::BaseController
      before_action :find_resource
      include ::Noteable

      private

      def notes_params
        params.require(:note).permit(:note, :user_id)
      end

      def find_resource
        @order = Spree::Order.find_by(number: params[:order_id])
      end
    end
  end
end
