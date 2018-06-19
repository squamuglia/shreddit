class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find_by_slug(params[:slug])
    @posts = @forum.posts
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.slug = to_slug(forum_params[:name])
    if @forum.save
      redirect_to "/forums/#{@forum.slug}"
    else
      render :new
    end
  end

  def edit
    @forum = Forum.find_by(params[:id])
  end

  def update
    @forum.update(forum_params)
  end

  def destroy
    @forum = Forum.find_by(params[:id]).destroy
  end

  private

  def forum_params
    params.require(:forum).permit(:name, :email, :password, :photo, :bio)
  end
end