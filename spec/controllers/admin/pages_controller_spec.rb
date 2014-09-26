require 'rails_helper'

RSpec.describe Admin::PagesController, :type => :controller do
	before do 
		admin_user = create(:admin_user)
    sign_in(admin_user)
  end

  describe "GET 'index'" do
    before do 
      @home = create(:page)
      @about = create(:page, page_type: 'About')
      @contact = create(:page, page_type: 'Contact')
    end
  	
    it 'populates a list of all pages' do 
      get :index
      expect(assigns(:pages)).to match_array([@home, @about, @contact])
  	end
    
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "assigns a page to @page" do
      # get 'show'
      # expect(response).to be_success
    end
  end

  describe "GET 'new'" do
  	it "assigns a new page to @page" do
      get :new
      expect(assigns(:page)).to be_a_new(Page)
	  end

    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "Get 'edit'" do

  	it "assigns a new page to @page" do
	  end

    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "PATCH 'update'" do 

  end

  describe "post 'create'" do 

  	context 'valid attributes' do 

  		it 'creates the page' do 
  		end

  		it 'renders index' do 
  		end
  	end

  	context 'invalid attributes' do

  		it 'does not creates page' do 
  		end

  		it 'renders new' do 
  		end
  	end
  end


  describe 'DELETE #destroy' do 

  	it 'deletes contact from database' do 
  	end

  	it 'redirects to index page' do
  	end
  end
end
