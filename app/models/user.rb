class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :comments
  has_many :items
  has_one :address
  has_one :card
  has_many :sns_credentials
  
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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得する。
    # ない場合はemailでユーザー検索を行い取得orビルド（保存はしない）
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はログイン処理へ移行するのでここでsnsのuser_idを更新する。
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
