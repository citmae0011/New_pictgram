class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 }
  

  has_secure_password
  
  has_many :topics
  has_many :favorites
end

