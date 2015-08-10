class Room < ActiveRecord::Base
  has_many :user, :through => :bookings
  has_and_belongs_to_many :bookings

  def get_user_email(id)
      User.find(id).email if id
  end
end
