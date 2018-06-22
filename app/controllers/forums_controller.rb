class ForumsController < ApplicationController

  def welcome
    render :layout =>  "home"
  end

  def index
    @forums = Forum.all

  end

  def show
    @forum = Forum.find_by_slug(params[:slug])
    @posts = @forum.posts
    @admins = @forum.forum_admins
    @fas = @forum.forum_admin_users
  end

  def new
    @forum = Forum.new
    #this will set the 'owner' of the forum as a user_id
    @forum.user_id = helpers.logged_in_user_id_integer
  end

  def create
    @forum = Forum.new(forum_params)
    #generate forum slug
    @forum.slug = to_slug(forum_params[:name])
    if @forum.save
      #create the forum admin relationship
      ForumAdmin.create(user_id: @forum.user_id, forum_id: @forum.id)
      redirect_to "/forums/#{@forum.slug}"
    else
      render :new
    end
  end

  def edit
    @forum = Forum.find_by_slug(params[:slug])
  end

  def update
    @forum = Forum.find_by_slug(params[:slug])
    @mods = @forum.forum_admins
    #this makes new mods for the forum by username
    @forum.create_moderators(params[:mod])
    #update the forum as well
    @forum.update_attributes(slug: params[:slug], name: params[:name])
    redirect_to "/forums/#{@forum.slug}"
  end

  def destroy
    #find forum via slug
    @forum = Forum.find_by_slug(params[:slug])
    #delete posts, likes, comments, all associated in that order
    @forum.delete_associated_posts
    #destroy forum
    @forum.destroy
    redirect_to "/forums"
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :description, :user_id)
  end

end
