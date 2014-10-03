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
	  		redirect_to action: :show, id: @page
	  	else
	  		render action: :new
	  	end
	  end
	  
	  def edit 

	  end 

	  def update
	  	if @page.update(page_params)
	  		flash[:notice] = 'Page has successfully been saved'
	  		redirect_to action: :show, id: @page
	  	else
	  		render action: :edit
	  	end
	  end

	  def destroy
	  end

	  private 

	  def load_page
	  	@page = Page.find(params[:id])
	  end

	  def page_params
	  	params.require(:page).permit(:parent_id, :body, :title, :description, :keywords, :is_published, :slug, :ancestry)
	  end
	end
end