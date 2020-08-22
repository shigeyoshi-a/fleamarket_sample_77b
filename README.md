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
|email|string|null: false, unique: true|                 #Eメール（一意性）
|nickname|string|null: false, unique: true|              #ユーザー名（一意性）
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
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|customer_id|string|null: false|                          #payjpの顧客id
|card_id|string|null: false|                              #payjpのデフォルトカードid

### Association
- belongs_to :user



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|zip_code|integer|null: false|                            #郵便番号
|prefectures|string|null: false|                          #都道府県
|municipality|string|null: false|                         #市区町村
|street_number|string|null: false|                        #番地
|apartment_name|string||                                  #マンション名やビル名、部屋番号（任意）
|number|integer||                                         #電話番号は（任意）

### Association
- belongs_to :user




## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|family_name|string|null: false|                          #苗字
|first_name|string|null: false|                           #名前
|family_name_reading|string|null: false|                  #苗字（ふりがな）
|first_name_reading|string|null: false|                   #名前（ふりがな）
|birthday|integer|null: false|                            #生年月日

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|product|string|null: false|                              #商品名
|description|text|null: false|                            #商品説明
|brand|string||                                           #ブランド（任意）
|condition|string|null: false|                            #商品状態
|fee|string|null: false|                                  #送料負担
|area|string|null: false|                                 #発送元地域
|day|string|null: false|                                  #発送日数
|price|string|null: false|                                #価格
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|category_id|integer|null: false, foreign_key: true|      #categoriesテーブルのid

### Association
- belongs_to :user
- belongs_to :category
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|          #itemsテーブルのid
|image|string|null: false|                                #商品イメージ

### Association
- belongs_to :item



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|ancestry|string|null: false|                          　 #カテゴリー名

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



#### 共有事項 確認事項####

・referenceは使用せずintegerで作成

・画像登録に関するカリキュラム　↓参考↓
https://master.tech-camp.in/curriculums/3993

・カテゴリーは経路列挙型モデルを採用する　↓参考↓
https://note.com/syojikishindoi/n/nd8ddd8cb93f8

・カード情報に関する記事　↓参考↓
https://qiita.com/takachan_coding/items/f7e70794b9ca03b559dd

