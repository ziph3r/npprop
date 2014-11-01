class ProductsController < FrontendsController
	layout 'frontend'

	def index
		@products = []
		if params[:search]
			params[:page] ||= 1
			condition_str = " is_show = true "
			args = []

			if params[:search][:zone_id] && params[:search][:zone_id].to_i != 0
				condition_str += " and zone_id = ? "
				args << params[:search][:zone_id].to_i
			end
			if params[:search][:province_id] && params[:search][:province_id].to_i != 0
				condition_str += " and province_id = ? "
				args << params[:search][:province_id].to_i
			end

			if params[:search][:keyword] && !params[:search][:keyword].strip.empty?
				condition_str += " and (lower(title) like ? or lower(content) like ?) "
				args << "%#{params[:search][:keyword].downcase}%"
				args << "%#{params[:search][:keyword].downcase}%"
			end

			if params[:search][:min_price] && params[:search][:min_price].to_f > 0
				condition_str += " and (search_price >= ?) "
				args << params[:search][:min_price].to_f
			end

			if params[:search][:max_price] && params[:search][:max_price].to_f > 0
				condition_str += " and (search_price <= ?) "
				args << params[:search][:max_price].to_f
			end
			@products = Product.where([condition_str, *args]).all.order('updated_at desc')
		else
			@products = Product.where('is_show = true ').all.order('updated_at desc').limit(8)
		end
		
		

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def zone
		params[:page] ||= 1
		@product_stars = Product.where(
			["province_id = ? and is_show = true ", params[:zone_id]]
		).all.order('updated_at desc').paginate(:page => params[:page])	
		sql = "			
			select
				z.id as zone_id,
				z.name as zone_name,
				pv.id as pv_id,
				pv.name as pv_name,
				count(products.id) as total
			from products 
			inner join zones z on z.id = products.zone_id
			inner join provinces pv on pv.id = products.province_id
			where products.is_show = true
			group by z.id, z.name, pv.id, pv.name 
			order by z.id
		"
		@zones = Zone.all 
		@selected_province = Province.find(params[:zone_id])
		@products = Product.find_by_sql(sql)

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def show
		@product = Product.find(params[:id])
		@product_stars = Product.where(
			["province_id = ? and is_show = true ", params[:zone_id]]
		).all.order('updated_at desc')
		sql = "			
			select
				z.id as zone_id,
				z.name as zone_name,
				pv.id as pv_id,
				pv.name as pv_name,
				count(products.id) as total
			from products 
			inner join zones z on z.id = products.zone_id
			inner join provinces pv on pv.id = products.province_id
			where products.is_show = true
			group by z.id, z.name, pv.id, pv.name 
			order by z.id
		"
		@zones = Zone.all 
		@inbox = Inbox.new
		@products = Product.find_by_sql(sql) 
	end

	def message
		product = Product.find(params[:id])

		@inbox = Inbox.new(inbox_params)
		
		if @inbox.valid?
			@inbox.product = product
			@inbox.save
			respond_to do |format|
			format.html {}
			format.js {}
		end
		else
			respond_to do |format|
				format.html {}
				format.js {}
			end
		end

		
	end

	private
	def inbox_params
		params.require(:inbox).permit(
			:title,
			:sender,
			:email,
			:phone,
			:message
		)
	end
end
