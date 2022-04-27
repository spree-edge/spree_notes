class Spree::Note < ApplicationRecord
  validates :note, :user_id, presence: true

  belongs_to :notable, polymorphic: true
  belongs_to :user, class_name: Spree.user_class.to_s
end
