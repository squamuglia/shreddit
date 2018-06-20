class CommentsController < ApplicationController

  def create
    session[:comment_errors] = []
    @comment = Comment.new(comment_params)
    @post = Post.find(comment_params[:post_id])
    if @comment.save
      redirect_to "/forums/#{@comment.post.forum.slug}/posts/#{@comment.post.slug}"
    else
      session[:comment_errors] << @comment.errors.full_messages.join
      redirect_to "/forums/#{@comment.post.forum.slug}/posts/#{@comment.post.slug}"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
