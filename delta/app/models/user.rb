class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name 
  has_secure_password
  validates :email, presence: true, 
                  uniqueness: true,
                  format: {
                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  }
  has_many :sessions
end
