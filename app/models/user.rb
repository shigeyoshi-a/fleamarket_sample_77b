class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments
  has_many :items
  has_one :address
  has_one :card
  has_many :likes, dependent: :destroy
  full_width = {with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
  full_width_kana = { with: /\A([ァ-ン]|ー)+\z/, message: 'を全角カタカナで入力してください' }

  validates :nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birthday ,presence: true
  validates :family_name,
  format: full_width
  validates :first_name,
  format: full_width
  validates :family_name_reading,
  format: full_width_kana
  validates :first_name_reading,
  format: full_width_kana
end

