class AddColumnBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :user_id, :integer, :null => false, :default => 1
    add_index :bookings, :user_id
    add_column :bookings, :room_id, :integer, :null => false, :default => 1
    add_index :bookings, :room_id
    add_column :bookings, :approval, :boolean
  end
end
