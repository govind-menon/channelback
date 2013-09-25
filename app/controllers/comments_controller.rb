class CommentsController < ApplicationController
  def show
  end

  def create
    @comment = Comment.new(:text => params[:comment_text])
    @comment.user = @current_user
    @comment.post = Post.find(params[:post_id])
    @comment.save
    redirect_to post_path(Post.find(params[:post_id]))
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    redirect_to post_path(Post.find(post_id))
  end
end