class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def redactor_authenticate_user!
    authorize # devise before_filter
  end

  def redactor_current_user
    current_admin_user # devise user helper
  end

  def current_admin_user
  	@current_admin_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
	end
	helper_method :current_admin_user

	def authorize
	  redirect_to signin_path, alert: "Not authorized" if current_admin_user.nil?
	end
end
