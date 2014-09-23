class SessionsController < ApplicationController
  def new
  end

  def create
  	admin_user = AdminUser.where(email: params[:session][:email]).first
	  if admin_user && admin_user.authenticate(params[:session][:password])
	    session[:admin_user_id] = admin_user.id
	    redirect_to admin_path, notice: "Logged in!"
	  else
	    flash.now.alert = "Email or password is invalid"
	    render "new"
	  end
  end

  def destroy
  	session[:admin_user_id] = nil
  	redirect_to root_url, notice: "Logged out!"
  end
  
end
