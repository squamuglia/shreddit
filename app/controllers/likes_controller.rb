class LikesController < ApplicationController
  def create
      @comment = Comment.find(params[:comment_id])
      @user = helpers.logged_in_user
      @like = Like.new(user_id: @user.id, comment_id: @comment.id)
      if @like.save
        redirect_to "/forums/#{@comment.post.forum.slug}/posts/#{@comment.post.slug}/"
      else
        redirect_to "/forums/#{@comment.post.forum.slug}/posts/#{@comment.post.slug}/"
      end
  end

  def destroy
  end
end
