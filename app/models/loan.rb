class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates_presence_of :user_id, :room_id, :input_register

end
