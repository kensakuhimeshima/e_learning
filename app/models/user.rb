class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id",
    dependent: :destroy
  
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id",
    dependent: :destroy

  has_many :following, through: :active_relationships,source: :followed
  has_many :followers, through: :passive_relationships,source: :follower
  has_many :activities
  has_many :answers, through: :lessons
  has_many :categories, through: :lessons


  has_secure_password
  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                                    format: {with: EMAIL_REGEX },
                                    uniqueness: {case_sensitive: false}

  validates :password, length: { minimum: 6 }, allow_nil: true
  
  mount_uploader :avatar, AvatarUploader

  def lesson_taken(category_id)
    lesson = lessons.find_by(category_id:category_id)
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  def dashboard_feed
    following_ids ="SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
    Activity.where("user_id IN (#{ following_ids }) OR user_id = :user_id",
    following_ids: following_ids, user_id: id)
  end
end
