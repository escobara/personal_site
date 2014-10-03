class PagesController < ApplicationController
	

	def home_page
		@page = Page.home.first
		if @page.present?
			render :show, :object => @page
		else
			render :instructions
		end
	end

end
