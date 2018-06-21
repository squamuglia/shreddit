class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :forum_admins
  has_many :forums, through: :forum_admin

  has_many :forum_follows
  has_many :forums, through: :forum_follow

  has_many :posts
  has_many :comments

  has_many :likes

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true


  def password=(value)
   @password = value
   self.password_digest = BCrypt::Password.create(value)
  end


  has_secure_password

end
