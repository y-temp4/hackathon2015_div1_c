class AddColumnRooms < ActiveRecord::Migration
  def change
  	add_column :rooms, :user_id, :integer
  	add_index :rooms, :user_id
  	add_column :rooms, :amount, :integer
  	add_column :rooms, :price, :integer
  	add_column :rooms, :message, :string
  	add_column :rooms, :address, :string
  end
end
