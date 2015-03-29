class User < ActiveRecord::Base
  has_many :trips
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  has_secure_password

end
