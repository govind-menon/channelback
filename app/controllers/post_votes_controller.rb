class PostVotesController < ApplicationController
  def create
    vote = PostVote.new
    vote.post =Post.find(params[:post_id])
    vote.user = @current_user
    vote.save
    redirect_to post_path(Post.find(params[:post_id]))
  end

  def destroy
    @vote = PostVote.find(params[:id])
    post_id = @vote.post_id
    @vote.destroy
    redirect_to post_path(Post.find(post_id))
  end
end