require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do
  
  describe "GET 'index'" do

  	describe 'user redirect' do 
	    login_user

	    it "redirects unauthorized user to signin_path" do
	      get 'index'
	      expect(response).to redirect_to(new_user_session_path) 
	    end
	  end

  	describe 'user redirect' do 
	    login_admin

	    it "renders the dashboard" do
	      get 'index'
	      expect(response).to be_success
	    end
	  end
  end

end
