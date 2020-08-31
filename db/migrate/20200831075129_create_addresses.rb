class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :receiving_family_name,            null: false
      t.string :receiving_first_name,             null: false
      t.string :receiving_family_name_reading,    null: false
      t.string :receiving_first_name_reading,     null: false
      t.string :post_code,                        null: false
      t.integer :prefecture_id,                   null: false
      t.string :municipality,                     null: false
      t.string :street_number,                    null: false
      t.string :apartment_name                       
      t.string :telephone_number
      t.references :user,                         null: false, foreign_key: true
      t.timestamps
    end
  end
end
