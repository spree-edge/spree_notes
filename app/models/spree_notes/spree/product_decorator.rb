# frozen_string_literal: true

module SpreeNotes
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable
      end
    end
  end
end

::Spree::Product.prepend(SpreeNotes::Spree::ProductDecorator)
