require 'rails_helper'

describe "Authentication", :type => :feature do

	describe 'with invalid information' do
		# before { visit signin_path }

		it 'should render the correct information' do 
			visit '/sessions/new'
			expect(page).to have_title()
		end
	end

end