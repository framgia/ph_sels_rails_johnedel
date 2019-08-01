class User < ApplicationRecord

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
                                   
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :lessons, dependent: :destroy
  has_many :categories, through: :lessons
  has_many :answers, through: :lessons
  has_many :activities

  before_save :downcase_email
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def lesson_taken(category_id)
    lesson = lessons.find_by(category_id:category_id)
  end

  private
    def downcase_email
      self.email = email.downcase
    end
  
end
