require 'rails_helper'

RSpec.describe Page, :type => :model do
  describe 'validations' do 
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:body) }
		it "should allow valid values" do
		  Page::PAGE_TYPE.each do |v|
		    should allow_value(v).for(:page_type)
		  end
		end
	end

	describe '.home' do 
		
	end

end
