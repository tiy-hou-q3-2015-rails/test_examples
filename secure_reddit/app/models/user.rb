class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  acts_as_followable
  acts_as_follower
end
