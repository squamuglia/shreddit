class PostsController < ActionController::Base
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :score, :title, :content)
  end

end
