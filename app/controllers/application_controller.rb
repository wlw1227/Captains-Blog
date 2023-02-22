class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def authenticate
    logged_in? || access_denied
  end

  def logged_in?
    current_user.present?
  end

  def access_denied
    login_path = new_user_session_path
    redirect_to(login_path, notice: "Please log in to continue") and return false
  end

  def after_sign_up_path_for(resource)
    new_profile_path
  end
end
