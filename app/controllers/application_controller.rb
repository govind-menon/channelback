class ApplicationController < ActionController::Base
  before_filter :get_current_user,:get_current_admin
  def get_current_user
    @current_user = if session[:user_id]
                      User.find(session[:user_id])
                    else
                      nil
                    end
  end

  def get_current_admin
    @current_admin = if session[:admin_id]
                      Admin.find(session[:admin_id])
                    else
                      nil
                    end
  end

  protect_from_forgery
end
