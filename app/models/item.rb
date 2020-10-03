class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :saler, class_name: "User"
  has_many :item_images
  has_many :comments
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :sending_days
  belongs_to_active_hash :sending_area

  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates_associated :item_images
  
  validates :name, :description, :condition_id, :delivery_fee_id, :sending_area_id, :sending_days_id, :price, :saler_id, presence: true
  validates :name,        length: { maximum: 40, :message => '文字数が41字以上です' }
  validates :description, length: { maximum: 1000, :message => '文字数が1001文字以上です' }
  validates :price,       numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, :message => '入力値が300~9,999,999の範囲外です' }

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end

end
