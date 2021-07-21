class Like < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_uniqueness_of :room_id, scope: :user_id
end
