# frozen_string_literal: true

module SpreeNotes
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable
      end
    end
  end
end

::Spree.user_class.prepend(SpreeNotes::Spree::UserDecorator)
