class AddDateToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :date, :datetime
  end
end
