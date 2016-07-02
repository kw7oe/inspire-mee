class ImagesController < ApplicationController
	
	def index
		@images = Image.reorder(sort_by + " DESC");
	end

	def new 
		@image = Image.new		
	end

	def create
		@image = Image.new(image_params)
		@images = Image.all
		respond_to do |format| 
			if @image.save
				format.html { redirect_to @image }
				format.json { head :no_content }
				format.js
			else
				
				format.json { render json: @image.errors.full_messages, 
                            status: :unprocessable_entity }
			end
		end
		
	end

	def show 
		@image = Image.find(params[:id])
	end

	def edit 
		@image = Image.find(params[:id])
	end

	def update 
		@image = Image.find(params[:id])
		if @image.update_attribute(image_params)
			redirect_to @image
		else
			render 'edit'
		end
	end
	
	def destroy
	end

	def inspired
		@image = Image.find(params[:id])
		@image.increase_count
		respond_to do |format| 
			format.html { redirect_to @image }
			format.js
		end
	end

	def uninspired
		@image = Image.find(params[:id])
		@image.decrease_count
		respond_to do |format| 
			format.html { redirect_to @image }
			format.js
		end
	end

	private
	def image_params
		params.require(:image).permit(:link, :caption)
	end

	def sort_by
		params[:sort] == "inspired_count" ? "inspired_count" : "created_at"
	end


end
