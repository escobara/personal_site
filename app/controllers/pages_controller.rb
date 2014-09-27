class PagesController < ApplicationController
	def home_page
		@page = Page.home.first rescue nil 
		render :show, :object => @page
	end

	def show
	end

	
end
