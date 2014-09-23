require 'rails_helper'

describe "Authentication", :type => :feature do

	describe 'with valid information' do
		before :each do
			create(:admin_user)
    	# AdminUser.create(:email => 'user@example.com', :password => 'caplin', :password_confirmation => 'caplin')
  	end

		it 'should render the correct information' do 
			visit '/sessions/new'
			expect(page).to have_title("Rene Escobar || Web Developer")
		end

		it 'signs the user in' do 
			visit '/sessions/new'
			within("form#session") do
     	 	fill_in 'session[email]', :with => 'admin@example.com'
      	fill_in 'session[password]', :with => 'password'
    	end
    	click_button 'Sign In'
    	expect(current_path).to eql(admin_path)
		end

		it 'DOES NOT sign the user in' do
			visit '/sessions/new'
			within("form#session") do
     	 	fill_in 'session[email]', :with => 'admin@example.com'
      	fill_in 'session[password]', :with => 'passwdodrd'
    	end
    	click_button 'Sign In'
    	expect(page).to have_content("Email or password is invalid")
		end
	end

	

end