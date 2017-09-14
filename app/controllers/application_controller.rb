class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true
  helper_method :logged_in?, :current_user, :require_login

  def require_login
    unless logged_in? || session[:user_id]
      flash[:error] = "Please log in or sign up."
      render :new
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:username])
    @users = User.all
  end

  def logged_in?
    @current_user != nil
  end


end
