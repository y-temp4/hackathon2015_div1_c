class Booking < ActiveRecord::Base
    belongs_to :users
    belongs_to :rooms
end
