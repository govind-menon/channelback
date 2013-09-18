class ApplicationController < ActionController::Base
  before_filter :get_current_user
  def get_current_user
    @current_user = if session[:user_id]
                      User.find(session[:user_id])
                    else
                      nil
                    end
  end
  protect_from_forgery
end
