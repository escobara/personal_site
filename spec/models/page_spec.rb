require 'rails_helper'

RSpec.describe Page, :type => :model do
  describe 'validations' do 
		it { should validate_presence_of(:title) }
		it { should validate_uniqueness_of(:title) }
		it { should validate_presence_of(:body) }
		it "should allow valid values" do
		  Page::PAGE_TYPE.each do |v|
		    should allow_value(v).for(:page_type)
		  end
		end
	end

	describe '#to_params' do 
		
	end


	describe '#is_published' do
		it 'has a default state of not published' do
			page = FactoryGirl.create(:page)
			expect(page.is_published).to eql(false)
		end
	end

	describe '#is_root' do 
		it 'return true if parent item' do
			page = FactoryGirl.create(:page)
			expect(page.is_root?).to eql(true)
		end		

		it 'returns false if child page' do
			page = FactoryGirl.create(:child_page)
			expect(page.is_root?).to eql(false)
		end		
	end

	describe '.home' do 
		before do 
			@page1 = create(:page, page_type: 'Home')
			@page2 = create(:page, page_type: 'Home', is_published: 1)
			@page3 = create(:page, page_type: 'About')
			@page4 = create(:page, page_type: 'Portfolio')
		end

		it 'should only return home' do 
			expect(Page.home).to match_array(@page2)
		end
	end
end
