module Spree
  module Admin
    class NoteSettingsController < Spree::Admin::BaseController

      def edit; end

      def update
        params.each do |name, value|
          next unless SpreeNotes::Config.has_preference? name

          SpreeNotes::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:note_settings))
        redirect_to spree.edit_admin_note_settings_path
      end
    end
  end
end
