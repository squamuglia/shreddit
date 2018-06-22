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

  def forum_admin_users
    self.forum_admins.map do |admin|
      admin.user
    end
  end

  #gets username of creator
  def creator
    User.find_by(id: self.user_id).username
  end

  def creator_object
    User.find_by(id: self.user_id)
  end


  #gets slug of creator
  def creator_slug
    User.find_by(id: self.user_id).slug
  end

  #delete the associated posts, in posts.rb, the associated comments are deleted, in comments.rb
  #the associated likes are deleted
  def delete_associated_posts
    #get posts in forum
    @posts = self.posts

    # delete associated post's comments, and then destroy the post
    @posts.each do |post|
      post.delete_associated_comments

    end
    # delete all posts in forum
    @posts.destroy_all
  end

  def create_moderators(mods)
    mod_list = []
    mods.each do |moderator|
      mod_list << User.all.find_by(username: moderator[1])
    end
    #check to see if the moderator is already a moderator
    refined_mod_list = mod_list.select do |mod|
      !self.forum_admins.include?(mod)
    end
    refined_mod_list = refined_mod_list.compact
    #list of forum admin usernames
    users = ForumAdmin.usernames
    #now create mods
    if refined_mod_list != []
      refined_mod_list.each do |rmod|
        if !users.include?(rmod.username)
          ForumAdmin.create(user_id: rmod.id, forum_id: self.id)
        else
          puts "#{rmod.username} is already a moderator for this forum!"
        end
      end
    end
  end
end
