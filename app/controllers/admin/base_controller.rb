module Admin
  class BaseController < ApplicationController
  	before_action :authenticate_admin


  	protected 

  	def admin_user?
  		user_signed_in? && current_user.admin?
  	end

  	def authenticate_admin
  		unless admin_user?
  		  redirect_to new_user_session_path, alert: "Only Administrators Allowed" 
  		end
  	end
  end
end