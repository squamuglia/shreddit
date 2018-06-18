class User < ApplicationRecord
  has_many :forum_admins
  has_many :forums, through: :forum_admin
  
  has_many :forum_follows
  has_many :forums, through: :forum_follow

end
