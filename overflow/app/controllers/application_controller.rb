class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  #Think about adding this to application_controller then add exceptions in individual controllers
  before_action :ensure_current_user, only[:create, :update, :destroy, :new]

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  private

  def ensure_current_user
    redirect_to login_path unless current_user
  end
end
