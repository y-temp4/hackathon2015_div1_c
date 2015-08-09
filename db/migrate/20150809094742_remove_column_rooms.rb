class RemoveColumnRooms < ActiveRecord::Migration
  def change
  	remove_column :rooms, :user_id, :integer
  	remove_index :rooms, :user_id
  	remove_column :rooms, :price, :integer
  	remove_column :rooms, :message, :string
  	remove_column :rooms, :address, :string
  end
end
