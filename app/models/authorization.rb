class Authorization < ActiveRecord::Base
  belongs_to :professor
  belongs_to :user
  belongs_to :room

  validates_presence_of :professor_id, :user_id, :room_id, :date_register, :date_expiration
end
