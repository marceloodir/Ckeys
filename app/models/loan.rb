class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates_presence_of :user_id, :room_id, :input_register

  scope :ativos, ->{ where('output_register IS NULL') }
  scope :inativos, ->{ where('output_register IS NOT NULL') and order('created_at DESC') }
end
