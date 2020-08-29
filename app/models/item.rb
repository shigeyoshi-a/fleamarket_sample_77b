class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :item_images
  has_many :comments
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
