class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  
  has_secure_password
  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                                    format: {with: EMAIL_REGEX },
                                    uniqueness: {case_sensitive: false}

  validates :password, length: { minimum: 6 }, allow_nil: true
  
  mount_uploader :avatar, AvatarUploader
end
