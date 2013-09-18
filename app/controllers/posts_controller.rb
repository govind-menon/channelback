class PostsController < ApplicationController
  # To change this template use File | Settings | File Templates.

  def index
    @posts = Post.all
  end

  def new
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @post = Post.new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_path
    else
      redirect_to edit_post_path
    end
  end

  def create
    if @current_user.nil?
      redirect_to sign_in_path
    else
      #puts "WHT" + params[:post].to_s
      #@post = @current_user.posts.build(params[:post])
      @post = Post.new(params[:post])
      @post.user_id = @current_user.id
      if @post.save
        redirect_to posts_path
      else
        redirect_to new_post_path
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end