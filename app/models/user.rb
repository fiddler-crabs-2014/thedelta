class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  
  has_many :answers
  has_many :comments
  has_many :votes




  def self.find_user_by_email_or_username(params)
  	if params.include?("@")
  		return User.find_by_email(params)
  	elsif params.present?
  		return User.find_by_username(params)
  	else
  		return nil
  	end
  end


end
