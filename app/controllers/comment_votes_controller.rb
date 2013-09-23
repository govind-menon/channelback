class CommentVotesController < ApplicationController
  def create
    vote = CommentVote.new
    vote.comments_id = params[:comment_id]
    vote.users_id = @current_user.id
    vote.save
    redirect_to post_path(Post.find(params[:post_id]))
  end

  def destroy
    @vote  = CommentVote.find_vote(params[:comment_id],@current_user.id).first
    @vote.destroy
    redirect_to post_path(Post.find(params[:post_id]))
  end
end