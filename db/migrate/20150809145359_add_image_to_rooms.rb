class AddImageToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :filename, :string
    add_column :rooms, :image, :binary
  end
end
