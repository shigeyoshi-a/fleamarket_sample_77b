class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code ,:receiving_family_name,:receiving_first_name ,:receiving_family_name_reading,:receiving_first_name_reading,  
  :prefecture_id , :municipality ,:street_number , presence: true

  validates :post_code, length: { is: 7 }
  validates :post_code,
  format: { with: /\A\d{7}\z/, message: "をハイフン(-)無しで７桁の半角数字で入力してください" }
  validates :receiving_family_name,
  format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
  validates :receiving_first_name,
  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
  validates :receiving_family_name_reading,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
  validates :receiving_first_name_reading,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }
end
