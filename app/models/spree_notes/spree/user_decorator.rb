# frozen_string_literal: true

module SpreeOrderNotes
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :spree_notes, as: :notable #if ::Spree::Config[:applicables].include?(self.class.to_s)
      end
    end
  end
end

if ::Spree::User.included_modules.exclude?(SpreeOrderNotes::Spree::UserDecorator)
  ::Spree::User.prepend SpreeOrderNotes::Spree::UserDecorator
end
