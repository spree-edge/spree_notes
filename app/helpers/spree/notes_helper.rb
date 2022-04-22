module Spree
  module NotesHelper
    def noteable_options(selected_value = nil)
      selected_value ||= SpreeNotes::Config[:noteables]
      options = noteable_klasses.map do |klass|
        [klass.table_name, klass]
      end
      options_from_collection_for_select(options, :first, :last, selected_value)
    end

    def noteable_klasses
      [Spree::Order, Spree::User, Spree::Product]
    end
  end
end
