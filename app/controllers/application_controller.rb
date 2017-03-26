class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_system
  helper_method :current_user

  private
  def get_system
    @system = System.first
  end

  def current_user  
    @current_user ||= Admin.find_by(id: session[:admin_id])
  end
end
