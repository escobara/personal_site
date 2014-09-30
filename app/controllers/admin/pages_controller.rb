module Admin
	class PagesController < BaseController
	  before_action :load_page, only: [:edit, :show, :update, :destroy]

	  def index
	  	@pages = Page.all
	  end

	  def new 
	  	@page = Page.new
	  end

	  def show 
	  end

	  def create
	  	@page = Page.new(page_params)
	  	if @page.save
	  		flash[:notice] = 'Page has successfully been saved'
	  		redirect_to action: :show
	  	else
	  		render action: :new
	  	end
	  end
	  
	  def edit 

	  end 

	  def update
	  	if @page.update_attributes(page_params)
	  		flash[:notice] = 'Page has successfully been saved'
	  		redirect_to action: :show
	  	else
	  		render action: :new
	  	end
	  end

	  def destroy
	  end

	  private 

	  def load_page
	  	@page = Page.find(params[:id])
	  end

	  def page_params
	  	params.require(:page).permit!
	  end
	end
end