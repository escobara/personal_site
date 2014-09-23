require "rails_helper"

feature 'Home Page' do 
	scenario 'Visit Homepage' do 
		visit root_path
		expect(title).to eql("Rene Escobar || Web Developer")
	end

	scenario 'show sign in link' do
		visit root_path
		expect(find('.footer')).to have_link("Sign In")
	end
	
end