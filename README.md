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

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|         #usersテーブルのid
|item_id|integer|null: false, foreign_key: true|         #itemsテーブルのid
|comment|string|null: false|                             #コメント内容

### Association
- belongs_to :user
- belongs_to :item

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|                               #ユーザー名
|password|string|null: false|                            #パスワード
|username|string|null: false|                            #Eメール

### Association

- has_many :comments
- has_many :items
- has_many :cards
- has_many :addresses
- has_many :profiles

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|customer_id|integer|null: false, foreign_key: true|      #payjpの顧客id
|card_id|integer|null: false, foreign_key: true|          #payjpのデフォルトカードid

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|postal_code|integer|null: false|                         #郵便番号
|prefectures|string|null: false|                          #都道府県
|city|string|null: false|                                 #市区町村
|〇〇|string|null: false|                                  #番地
|house|string||                                           #マンション名やビル名、部屋番号は任意
|number|integer||                                         #電話番号は任意

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
|birthday|string|null: false|                             #生年月日

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|product|string|null: false|                              #商品名
|description|text|null: false|                            #商品説明
|brand|string|null: false|                                #ブランド
|condition|string|null: false|                            #商品状態
|fee|string|null: false|                                  #送料負担
|area|string|null: false|                                 #発送元地域
|day|string|null: false|                                  #発送日数
|price|string|null: false|                                #価格

|user_id|integer|null: false, foreign_key: true|          #usersテーブルのid
|image_id|integer|null: false, foreign_key: true|         #imagesテーブルのid
|category_id|integer|null: false, foreign_key: true|      #categoriesテーブルのid

### Association
- belongs_to :user
- has_many :image
- has_many :category, through:  :item_category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|          #itemsテーブルのid
|image|string|null: false|                                #商品イメージ

### Association
- belongs_to :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|                                 #カテゴリー名

### Association
- has_many :items, through:  :item_category

## item_categoryテーブル                  #中間テーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|             #itemsテーブルのid
|category_id|integer|null: false, foreign_key: true|         #categoriesテーブルのid

### Association
- belongs_to :item
- belongs_to :category

#### 共有事項 ####

・意見をまとめた形の内容です
・アソシエーション全然考えていなかったのでとりあえず打ち込みました
・アソシエーションなっていないことでどのデーブルどのIDもってくるかも不透明です
・カラムに抜けがある、または命名と内容があってない可能性があるのでふさわしい命名があればお願いします
・ER図の草案、できたら共有お願いします。
・画像登録に関するカリキュラム　↓参考↓
https://master.tech-camp.in/curriculums/3993
・カテゴリの部分、例のあれを検討　↓参考↓
https://note.com/syojikishindoi/n/nd8ddd8cb93f8
・カード情報に関する記事　↓参考↓
https://qiita.com/takachan_coding/items/f7e70794b9ca03b559dd
※ネットにある情報なので、万が一間違っている可能性もあり
------------------------------------------------
referenceは使用せずintegerで作成
has_one関連付けするのよさげかも？？？
番地に変わる英語

string (文字列が２５５字まで)
text(それ以上)