class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.find(params[:id])
  end
  #
  # def new
  # end
  #
  # def create
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

  # def comment_params
  #   params.require(:post).permit(:user_id, :score, :title, :content)
  # end
end
