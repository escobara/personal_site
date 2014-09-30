require 'rails_helper'

RSpec.describe Page, :type => :model do
  describe 'validations' do 
		it { should validate_presence_of(:title) }
		it { should validate_uniqueness_of(:title) }
		it { should validate_presence_of(:body) }
		it { should validate_uniqueness_of(:page_type)}
		it "should allow valid values" do
		  Page::PAGE_TYPE.each do |v|
		    should allow_value(v).for(:page_type)
		  end
		end
	end

	describe '#is_published' do
		it 'has a default state of not published' do
			page = FactoryGirl.create(:page)
			expect(page.is_published).to eql(false)
		end
	end

	describe '.home' do 
		before do 
			@page1 = create(:page, page_type: 'Home')
			@page2 = create(:page, page_type: 'About')
			@page3 = create(:page, page_type: 'Portfolio')
		end

		it 'should only return home' do 
			expect(Page.home).to match_array(@page1)
		end
	end

	describe '#to_param' do
		it 'should return the title page if not defined' do
			@page1 = create(:page, page_type: 'About')
			expect(@page1.slug).to eql('about')
		end

		it 'should be empty if home page' do
			@page1 = create(:page, page_type: 'Home')
			expect(@page1.slug).to eql('')
		end

		it 'returns the slug if defined' do 
			@page1 = create(:page, page_type: 'About')
			@page2 = create(:page, page_type: 'About', slug: 'About Us')
			expect(@page2.slug).to eql('about-us')
		end

		it 'returns a slug + 1 if slug undefined and taken' do
			@page1 = create(:page, page_type: 'About')
			@page2 = create(:page, page_type: 'About')
			expect(@page2.slug).to eql('about-us-2')
		end
	end
end
