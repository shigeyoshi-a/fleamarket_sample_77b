class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :sending_area_id, null: false
      t.integer :sending_days_id, null: false
      t.integer :price, null: false
      t.integer :buyer_id, null: false, foreign_key: true
      t.integer :saler_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end