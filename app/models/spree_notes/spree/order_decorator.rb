module SpreeNotes
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable
      end
    end
  end
end

::Spree::Order.prepend(SpreeNotes::Spree::OrderDecorator)
