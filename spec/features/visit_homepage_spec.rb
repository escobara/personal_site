require "rails_helper"

feature 'Home Page' do 
	scenario 'Visit Homepage' do 
		visit root_path
		expect(title).to eql("Rene Escobar || Web Developer")
	end

	
end