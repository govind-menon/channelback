class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice]= 'You may now login'
      redirect_to sign_in_path
    else
      redirect_to new_user_path
    end
  end

  def sign_in
    if not session[:user_id].nil?
      redirect_to posts_path
    end
  end

  def login
    @user = User.authenticate(params[:email],params[:password])
    if @user.nil?
      flash[:error] = 'Invalid username or password'
      redirect_to sign_in_path
    else
      session[:user_id] = @user.id
      flash[:notice]= 'Welcome and Bien Venue'
      redirect_to posts_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice]= 'You have been logged out'
    redirect_to sign_in_path
  end

end