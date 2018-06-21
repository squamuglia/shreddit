class Forum < ApplicationRecord
  has_many :forum_admins
  has_many :users, through: :forum_admin

  has_many :posts

  validates :name, presence: true
  validates :name, uniqueness: true

  def forum_admin_usernames
    #map all of the admin usernames for easier deplay on forum#show
    self.forum_admins.map do |admin|
      admin.user.username
    end
  end

  #gets username of creator
  def creator
    User.find_by(id: self.user_id).username
  end

  #gets slug of creator
  def creator_slug
    User.find_by(id: self.user_id).slug
  end

end
