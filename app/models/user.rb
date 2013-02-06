class User <ActiveRecord::Base
  has_many :posts

  attr_accessible :screenname, :email, :password

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            format: {with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :screenname, presence: true, 
            uniqueness: { case_sensitive: false }, length: { minimum: 6 }
end