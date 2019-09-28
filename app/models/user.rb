class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 }
  

  has_secure_password
  
  has_many :topicss
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
end

