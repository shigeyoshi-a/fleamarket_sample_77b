class ChangeColumnsAddNotnullOnComment < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :comment, :string, null: false
  end
end
