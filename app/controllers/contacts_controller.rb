class ContactsController < FrontendsController
	layout 'frontend'

	def index
		@inbox = Inbox.new
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
	end

	def create
		@inbox = Inbox.new(inbox_params)

		if @inbox.valid?
			@inbox.save

			redirect_to contacts_path, :notice => "ข้อความของท่านถูงส่งให้ทีมงานแล้ว"
		else
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
			render :index
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
