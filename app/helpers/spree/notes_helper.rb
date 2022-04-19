module Spree
  module NotesHelper
    NOTEABLE_KLASSES = %w(orders users)

    def noteable_options(selected_value = nil)
      selected_value ||= SpreeNotes::Config[:noteables]
      options = NOTEABLE_KLASSES.map do |klass|
        [klass, klass.titleize]
      end
      options_from_collection_for_select(options, :first, :last, selected_value)
    end
  end
end
