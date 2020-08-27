# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

-------------------------------------------------------------------------------

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|              #ユーザー名（一意性）
|email|string|null: false, unique: true|                 #Eメール（一意性）
|password|string|null: false|                            #パスワード

### Association
- has_many :comments
- has_many :items
- has_one :card
- has_one :addresse
- has_one :profile




## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|                          #payjpの顧客id
|card_id|string|null: false|                              #payjpのデフォルトカードid
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid

### Association
- belongs_to :user




## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|                          #苗字
|first_name|string|null: false|                           #名前
|family_name_reading|string|null: false|                  #苗字（ふりがな）
|first_name_reading|string|null: false|                   #名前（ふりがな）
|post_code|string|null: false|                            #郵便番号
|prefectures|string|null: false|                          #都道府県
|municipality|string|null: false|                         #市区町村
|street_number|string|null: false|                        #番地
|apartment_name|string||                                  #マンション名やビル名、部屋番号（任意）
|telephone_number|string||                               #電話番号は（任意）
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid

### Association
- belongs_to :user




## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|                          #苗字
|first_name|string|null: false|                           #名前
|family_name_reading|string|null: false|                  #苗字（ふりがな）
|first_name_reading|string|null: false|                   #名前（ふりがな）
|birthday|string|null: false|                             #生年月日
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid

### Association
- belongs_to :user




## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|                                 #商品名
|description|text|null: false|                            #商品説明
|brand|string||                                           #ブランド（任意）
|condition|string|null: false|                            #商品状態
|delivery_fee|string|null: false|                         #送料負担
|sending_area|string|null: false|                         #発送元地域
|sending_days|string|null: false|                         #発送日数
|price|integer|null: false|                               #価格
|buyer_id|integer|null: false, foreign_key: true|         #usersテーブルのid（購入者）
|saler_id|integer|null: false, foreign_key: true|         #usersテーブルのid（出品者）
|category_id|integer|null: false, foreign_key: true|      #categoriesテーブルのid

### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :comments




## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|                                #商品イメージ
|item_id|integer|null: false, foreign_key: true|          #itemsテーブルのid

### Association
- belongs_to :item




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false, add_index|                 #カテゴリー名
|ancestry|string||                                       #ancestry

### Association
- has_many :items
  has_ancestry




## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|         #usersテーブルのid
|item_id|integer|null: false, foreign_key: true|         #itemsテーブルのid
|comment|string|null: false|                             #コメント内容

### Association
- belongs_to :user
- belongs_to :item

