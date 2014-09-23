require 'rails_helper'

describe "Authentication", :type => :feature do

	describe 'with invalid information' do
		before :each do
    	AdminUser.create(:email => 'user@example.com', :password => 'caplin', :password_confirmation => 'caplin')
  	end

		it 'should render the correct information' do 
			visit '/sessions/new'
			expect(page).to have_title("Rene Escobar || Web Developer")
		end

		it 'signs the user in' do 
			visit '/sessions/new'
			within("form#session") do
     	 	fill_in 'session[email]', :with => 'user@example.com'
      	fill_in 'session[password]', :with => 'caplin'
    	end
    	click_button 'Sign In'
    	expect(page).to have_content('Logged in!')
		end
	end

end