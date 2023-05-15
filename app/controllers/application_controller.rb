class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def demo
     render html: "Hello there"
  end

  helper_method :current_user, :logged_in?, :require_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def logged_in?
      !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must login to perform the action"
      redirect_to login_path
    end
  end
  
end
