class ForumAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  def username
    #get the username of the admin
    User.find_by(id: self.user_id).username
  end

  def slug
    User.find_by(id: self.user_id).slug
  end

  def self.usernames
    farray=[]
    ForumAdmin.all.map do |fa|
      farray << fa.user.username
    end
    farray
  end
end
