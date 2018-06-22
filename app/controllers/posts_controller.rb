class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_slug(params[:slug])
    @comments = @post.comments
    @comment = Comment.new(post_id: @post.id)
    @comment.user_id = helpers.logged_in_user_id_string
    @like = Like.new
    @user = @post.user
    @fas = @post.forum.forum_admin_users
  end

  def new
    @forum = Forum.find_by_slug(params[:slug])
    @post = Post.new(forum_id: @forum.id)
    @post.user_id = helpers.logged_in_user_id_string
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
    @post = Post.find_by_slug(params[:slug])
  end

  def update
    @post = Post.find_by_slug(post_params[:slug])
    @post.update_attributes(post_params)
    redirect_to "/forums/#{@post.forum.slug}/posts/#{@post.slug}"
  end

  def destroy
    #find post via slug
    @post = Post.find_by_slug(params[:slug])
    #delete all comments and likes associated with the post
    @post.delete_associated_comments
    #delete the post
    @post.destroy
    redirect_to "/forums/#{@forum_slug}"
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :score, :title, :content, :slug, :forum_id)
  end

end
