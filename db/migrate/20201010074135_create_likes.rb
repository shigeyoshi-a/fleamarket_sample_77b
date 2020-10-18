class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :item_id, null: false
      t.integer :user_id, null: false
    end
  end
end
