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

	describe '#is_published' do
		it 'has a default state of not published' do
			page = FactoryGirl.create(:page)
			expect(page.is_published).to eql(false)
		end
	end

end
