require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do

  describe "GET 'index'" do
    it "redirects unauthorized user to signin_path" do
      get 'index'
      expect(response).to redirect_to(signin_path) 
    end

    it "redirects unauthorized user to signin_path" do
    	admin_user = create(:admin_user)
    	sign_in(admin_user)
      get 'index'
      expect(response).to be_success
    end
  end

end
