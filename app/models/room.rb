class Room < ActiveRecord::Base
  has_many :user, :through => :bookings
  has_and_belongs_to_many :bookings


  validates :title, presence: true, length: { maximum: 80, message: "80文字以内で入力してください"}
  validates :amount, presence: true, numericality: { greater_than: 1, message: "1人の募集が必須です" }
  validates :price, presence: true, numericality: { greater_than: 0, message: "価格は0円以上に設定してください"}
  validates :message, presence: { message: "空白禁止です" }
  validates :address, presence: { message: "空白禁止です" }

  def get_user_email(id)
      User.find(id).email if id
  end
end
