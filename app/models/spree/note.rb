class Spree::Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  belongs_to :user
end
