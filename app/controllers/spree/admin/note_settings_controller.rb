module Spree
  module Admin
    class NoteSettingsController < Spree::Admin::BaseController

      def edit; end

      def update
        processed = 0
        params.each do |name, value|
          next unless SpreeNotes::Config.has_preference? name

          processed += 1
          SpreeNotes::Config[name] = value
        end
        SpreeNotes::Config[:noteables] = nil if processed == 0

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:note_settings))
        redirect_to spree.edit_admin_note_settings_path
      end
    end
  end
end
