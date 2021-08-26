class Room < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :tags, dependent: :destroy

  validates :image, presence: true
end
