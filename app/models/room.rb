class Room < ActiveRecord::Base
  has_many :authorizations, :dependent => :restrict_with_exception
  has_many :loans, :dependent => :restrict_with_exception
  
  validates_presence_of :title
end
