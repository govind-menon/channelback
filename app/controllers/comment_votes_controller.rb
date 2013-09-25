class CommentVotesController < ApplicationController
  def create
    vote = CommentVote.new
    vote.comment = Comment.find(params[:comment_id])
    vote.user = @current_user
    vote.save
    redirect_to post_path(Post.find(params[:post_id]))
  end

  def destroy
    @vote  = CommentVote.find_vote(params[:comment_id],@current_user.id).first
    @vote.destroy
    redirect_to post_path(Post.find(params[:post_id]))
  end
end