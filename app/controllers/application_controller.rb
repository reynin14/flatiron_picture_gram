class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  543
  helper_method :logged_in?, :current_user

  def require_login
    unless logged_in?
      flash[:error] = "Please log in or sign up."
      render :new
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:username])
  end

  def logged_in?
    @current_user != nil
  end

end
