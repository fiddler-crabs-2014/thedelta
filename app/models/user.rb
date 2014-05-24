class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :answers
  has_many :comments
  has_many :votes

  has_secure_password


end