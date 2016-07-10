class ImagesController < ApplicationController
	include CurrentVisitor
	before_action :set_visitor
	before_action :set_image, only: [:show, :edit, :update, :destroy, :inspired, :uninspired]
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_image
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
	end

	def edit 		
	end

	def update 		
		if @image.update_attribute(image_params)
			redirect_to @image
		else
			render 'edit'
		end
	end

	def destroy
		@image.destroy
	end

	def inspired
		@image.increase_count

		# Track if the visitor has upvoted the image. Not suitable if the application
		# grow larger. Since the session is stored in Cookies Store, which has limited 
		# storage of 4KB. 
		session[:visitor][@image.id] = true
		
		respond_to do |format| 
			format.html { redirect_to @image }
			format.js
		end
	end

	def uninspired
		@image.decrease_count
		session[:visitor][@image.id] = false
		respond_to do |format| 
			format.html { redirect_to @image }
			format.js
		end
	end

	private
	def set_image
		@image = Image.find(params[:id])
	end

	def image_params
		params.require(:image).permit(:link, :caption)
	end

	def sort_by
		params[:sort] == "inspired_count" ? "inspired_count" : "created_at"
	end

	def invalid_image
		logger.error "Attempt to access invalid image: #{params[:id]}"
		redirect_to root_url
	end


end
