# frozen_string_literal: true

module SpreeOrderNotes
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable
      end
    end
  end
end

if ::Spree.user_class.included_modules.exclude?(SpreeOrderNotes::Spree::UserDecorator)
  ::Spree.user_class.prepend SpreeOrderNotes::Spree::UserDecorator
end
