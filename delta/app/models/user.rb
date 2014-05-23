class User < ActiveRecord::Base
  has_many :answers
  has_many :comments
  has_many :votes
end
