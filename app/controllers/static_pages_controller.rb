class StaticPagesController < ApplicationController

	def index
		@images = Image.all
	end

	def about
	end
	
end
