class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_uniqueness_of :api_key

  has_secure_password
end
