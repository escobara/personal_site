require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

	describe 'get homepage' do 
		context 'with no homepage created' do
			before { get :home_page }

			it 'renders instruction template' do 
				expect(Page.count).to eql(0)
				get :home_page, id: nil
				expect(response).to render_template('instructions')
			end
		end
		context 'with no homepage created' do
			before { create :page, :published }

			it 'with homepage created' do
				get :home_page
				expect(response).to render_template('show')
			end
		end
	end

end
