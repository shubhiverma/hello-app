class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 20},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  validates :password, presence: true
  has_secure_password
end