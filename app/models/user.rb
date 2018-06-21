class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :forum_admins
  has_many :forums, through: :forum_admin

  has_many :posts
  has_many :comments

  has_many :likes



  def password=(value)
   @password = value
   self.password_digest = BCrypt::Password.create(value)
  end


  has_secure_password

end
