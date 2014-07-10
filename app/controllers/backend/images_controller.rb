class Backend::ImagesController < ApplicationController
	layout 'backend'

	def index
		@images = Image.all.order("created_at desc")
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			redirect_to backend_images_path
		else
			render :new
		end
	end	

	def destroy
		@image = Image.find(params[:id])

		@image.destroy
		redirect_to backend_images_path
	end

	private
	def image_params
		params.require(:image).permit(
			:id, :file, :name
		)
	end
end
