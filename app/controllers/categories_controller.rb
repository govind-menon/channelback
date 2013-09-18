class CategoriesController < ApplicationController
  # To change this template use File | Settings | File Templates.

  before_filter :check_if_admin

  def check_if_admin
    if @current_admin.nil?
      redirect_to admin_sign_in_path
    end
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def edit
    @category = Post.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path
    else
      redirect_to edit_category_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

end