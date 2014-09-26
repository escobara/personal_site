module Admin
	class PagesController < BaseController
	  def index
	  	@pages = Page.all
	  end

	  def new 
	  	@page = Page.new
	  end

	  def show 
	  end

	  def create
	  	@page = Page.new
	  end
	  
	  def edit 
	  end 

	  def update
	  end

	  def destroy
	  end

	  
	end
end