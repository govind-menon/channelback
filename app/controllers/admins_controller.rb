class AdminsController < ApplicationController
  # To change this template use File | Settings | File Templates.
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to admins_path
    else
      redirect_to new_admin_path
    end
  end

  def edit
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      redirect_to admins_path
    else
      redirect_to edit_admin_path
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if not @admin.email.to_s.eql? 'batman@gotham.com'
      @admin.destroy
      @admin.save

      if session[:admin_id] = @admin.id
        session[:admin_id] = nil
      end

      redirect_to admin_sign_in_path
    else
      redirect_to admins_path
    end


  end

  def sign_in
    if not session[:admin__id].nil?
      redirect_to admins_path
    end
  end

  def login
    @admin = Admin.authenticate(params[:email],params[:password])
    if @admin.nil?
      flash[:error] = 'Invalid username or password'
      redirect_to admin_sign_in_path
    else
      session[:admin_id] = @admin.id
      flash[:notice]= 'Welcome and Bien Venue'
      redirect_to admins_path
    end
  end

  def logout
    session[:admin_id] = nil
    flash[:notice]= 'You have been logged out'
    redirect_to admin_sign_in_path
  end

  def activity
    @posts = Post.all.sort {|p,q| p.post_votes.count < q.post_votes.count}
    @comments = Comment.all.sort {|p,q| p.comment_votes.count < q.comment_votes.count}
  end
  
end