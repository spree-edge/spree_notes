module SpreeOrderNotes
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable #if ::SpreeNotes::Config[:noteables].include?('orders')
      end
    end
  end
end

::Spree::Order.prepend SpreeOrderNotes::Spree::OrderDecorator if ::Spree::Order.included_modules.exclude?(SpreeOrderNotes::Spree::OrderDecorator)
