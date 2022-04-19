# frozen_string_literal: true

module SpreeOrderNotes
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable if ::SpreeNotes::Config[:noteables].include?('users')
      end
    end
  end
end

if ::Spree::User.included_modules.exclude?(SpreeOrderNotes::Spree::UserDecorator)
  ::Spree::User.prepend SpreeOrderNotes::Spree::UserDecorator
end
