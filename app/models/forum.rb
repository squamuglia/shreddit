class Forum < ApplicationRecord
  has_many :forum_admins
  has_many :users, through: :forum_admin

  has_many :forum_follows
  has_many :users, through: :forum_follow

  has_many :posts
end
