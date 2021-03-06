class HomeController < FrontendsController
	layout 'frontend'
	def index
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
		@product_stars = Product.where(
			"products.is_show = true and products.is_starred = true "
		).order('updated_at desc').paginate(:page => params[:page])	
		@newses = News.where(
			"is_publish = true "
		).all.order('updated_at desc').paginate(:per_page => 10,:page => params[:page])
	end
end
