class Backend::ProductsController < ApplicationController
	layout 'backend'
	def index
		# raise('test')
		params[:page] ||= 1
		condition_str = " true "
		args = []
		if params[:search]
			if params[:search][:keyword] && !params[:search][:keyword].strip.empty?
				condition_str += " and lower(products.title) like ? "
				args << "%#{params[:search][:keyword].downcase}%"
			end
			if params[:search][:zone_id] && params[:search][:zone_id].to_i != 0
				condition_str += " and z.id = ? "
				args << params[:search][:zone_id]
			end
			if params[:search][:province_id] && params[:search][:province_id].to_i != 0
				condition_str += " and products.province_id = ? "
				args << params[:search][:province_id]
			end
			if params[:search][:is_starred] && params[:search][:is_starred].to_i == 1
				condition_str += " and products.is_starred is true"
			end
		end

		@products = Product.where([condition_str, *args])
		.all
		.joins("inner join zones z on z.id = products.zone_id ")
		.order("products.created_at desc")
		.paginate(:page => params[:page])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.valid?
			@product.save
			redirect_to backend_products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def upload
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update_attributes(product_params)
			redirect_to backend_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy

		redirect_to backend_products_path
	end

	def image_upload
		@product = Product.find(params[:id])
		begin
			@product_image = @product.product_images.new(product_image_params)
			if @product_image.save
				redirect_to upload_backend_product_url(@product)
			else
				# redirect_to action: 'new'
			end
		rescue
			render :upload
		end


	end

	def remove_image
		@product = Product.find(params[:id])
	    product_image = ProductImage.find(params[:image_id])
	    product_image.destroy if product_image

	    redirect_to upload_backend_product_url(@product)
	end

	private

	def product_params
		params.require(:product).permit(
			:title,
			:code,
			:content,
			:short_desc,
			:sqr_area,
			:zone_id,
			:width,
			:depth,
			:sell_price,
			:land_price,
			:rent_price,
			:search_price,
			:is_show,
			:product_status_master_id,
			:contact_id,
			:province_id,
			:is_starred,
			product_images_attributes: [:id, :image]
		)
	end

	def product_image_params
		params.require(:product_image).permit(
			:id, :image
		)
	end
end

