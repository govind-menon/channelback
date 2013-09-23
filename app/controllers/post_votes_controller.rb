class PostVotesController < ApplicationController
  def create
    vote = PostVote.new
    vote.posts_id = params[:post_id]
    vote.users_id = @current_user.id
    vote.save
    redirect_to post_path(Post.find(params[:post_id]))
  end

  def destroy
    @vote = PostVote.find(params[:id])
    post_id = @vote.posts_id
    @vote.destroy
    redirect_to post_path(Post.find(post_id))
  end
end