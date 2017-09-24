class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:admin])
  end

  def logged_in?
    current_user != nil
  end

  protected

  def authorize
    unless logged_in?
      flash[:error] = "unauthorized access"
      redirect_to login_path
      false
    end
  end
end
