class Spree::Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  belongs_to :user, class_name: Spree.user_class.to_s
end
