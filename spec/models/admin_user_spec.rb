require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
	describe 'validations' do 
		it { should respond_to(:password_digest)}
		it { should validate_uniqueness_of(:email) }
	end

	describe 'when password doesnt match confirmation' do 
		before do 
			@admin = AdminUser.new( email: "user@example.com",
                     password: " ", password_confirmation: " ")
		end
		it { expect(@admin).to be_invalid }
	end
end
