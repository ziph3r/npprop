class ProductsController < ApplicationController
	layout 'frontend'

	def index
		# @products = Product.all
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
		@products = Product.find_by_sql(sql)
		@product_stars = Product.all.order('updated_at desc')
	end

	def zone
		@products = Product.where(
			["province_id = ? and is_show = true ", params[:zone_id]]
		).all.order('updated_at desc')

	end

	def show
		@product = Product.find(params[:id])
	end
end