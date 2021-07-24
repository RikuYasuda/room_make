class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_rooms, through: :likes, source: :room
  def already_liked?(room)
    self.likes.exists?(room_id: room.id)
  end
end
