module ControllerHelpers
	def sign_in(admin_user)
		admin_user = AdminUser.where(:email => admin_user.email).first
		request.session[:admin_user_id] = admin_user.id
	end
end