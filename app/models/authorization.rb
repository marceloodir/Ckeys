class Authorization < ActiveRecord::Base
  belongs_to :user
  belongs_to :authorizer, :class_name => 'User'
  belongs_to :room

  validates_presence_of :user_id, :authorizer_id, :room_id, :date_register, :date_expiration

  scope :ativos, ->{ where('date_expiration >= ?', Time.now) }
  scope :expirados, ->{ where('date_expiration < ?', Time.now) }

end
