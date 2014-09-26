require 'rails_helper'

class TestHelper < ActionView::Base; end

describe AdminFormBuilder do 
  let(:helper) { TestHelper.new }
  let(:resource)  { FactoryGirl.build :page }
  let(:builder) { AdminFormBuilder.new :page, resource, helper, {}, nil }


	describe '#text_field' do	
	  
	end

	describe '#text_area' do 
	
	end


end