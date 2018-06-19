class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_slug(params[:slug])
    @comments = @post.comments
    @comment = Comment.new(post_id: @post.id)
    @user = @post.user
  end

  def new
    @forum = Forum.find_by_slug(params[:slug])
    @post = Post.new(forum_id: @forum.id)
  end

  def create
    @post = Post.new(post_params)
    @post.slug = to_slug(post_params[:title])
    if @post.save
      redirect_to "/forums/#{@post.forum.slug}/posts/#{@post.slug}"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :score, :title, :content, :forum_id)
  end

end
