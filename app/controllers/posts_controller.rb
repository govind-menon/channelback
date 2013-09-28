class PostsController < ApplicationController
  # To change this template use File | Settings | File Templates.

  def index
    @posts = Post.all.sort {|p,q| p.active_score <=> q.active_score}
    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])
    if not @current_user.nil?
      @vote = PostVote.find_vote(@post.id,@current_user.id).first
    end
  end

  def new
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @categories = Category.all
      @post = Post.new
    end
  end

  def edit
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @post = Post.find(params[:id])
      @categories = Category.all
    end

  end

  def update
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @post = Post.find(params[:id])
      @post.category = Category.find(params[:post][:category_id])
      tags = params[:post][:tags]
      @post.tags = []
      tags.split(',').each do |tag|
        t = Tag.find_by_name(tag)
        if t.nil?
          t = Tag.new(:name => tag)
          t.save
        end
        t.post= @post
        @post.tags << t
      end
      @post.assign_attributes(params[:post].except(:category_id).except(:tags))
      if @post.save
        redirect_to posts_path
      else
        redirect_to edit_post_path
      end
    end
  end

  def create
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @post = Post.new(params[:post].except(:category_id).except(:tags))
      @post.user = @current_user
      @post.category= Category.find(params[:post][:category_id])
      tags = params[:post][:tags]
      tags.split(',').each do |tag|
        t = Tag.find_by_name(tag)
        if t.nil?
          t = Tag.new(:name => tag)
          t.save
        end
        t.post = @post
        @post.tags << t
      end
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

  def search
    @categories = Category.all
    @posts = Post.find_all_by_category_id(params[:category][:category_id]).select {|p| p.title.downcase.include? params[:query].downcase or p.tag_string.downcase.include? params[:query].downcase or p.content.downcase.include? params[:query].downcase or p.user.name.downcase.include? params[:query].downcase}
    render 'index'
  end

end