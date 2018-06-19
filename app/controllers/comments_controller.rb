class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/forums/#{@comment.post.forum.slug}/posts/#{@comment.post.slug}"
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
