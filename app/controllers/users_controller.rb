class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if @current_admin.nil?
      redirect_to admin_sign_in_path
    else
      @users = User.all
    end
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

  def promote
    @user = User.find(params[:id]).serializable_hash.to_hash
    @admin = Admin.new(@user.except('id').except('handle').except('comments_id'))
    @admin.save
    redirect_to admin_users_path
  end

  def demote
   @admin = Admin.find_by_email(User.find(params[:id]).email)
   puts 'demote' + @admin.serializable_hash.to_hash.to_s
   @admin.destroy
   if session[:admin_id].eql? @admin.id
     session[:admin_id] = nil
   end
   redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end