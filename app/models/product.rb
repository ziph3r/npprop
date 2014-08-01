class Product < ActiveRecord::Base
	self.per_page = 10
	belongs_to :product_status_master
	belongs_to :contact
	belongs_to :zone
	belongs_to :province
	has_many :product_images

	validates :title, :code, presence: true
	validates :code, :uniqueness => true
	validates :content , presence: true

	def to_s
		title
	end

	def is_sell
		product_status_master_id == ProductStatusMaster::SELL_ID
	end
	def is_hold
		product_status_master_id == ProductStatusMaster::HOLD_ID
	end

	def web_price
	 	if is_sell
	 		if !sell_price.strip.empty?
	 			return sell_price
	 		elsif !land_price.strip.empty?
	 			return land_price
	 		elsif !rent_price.strip.empty?
	 			return rent_price
	 		else
	 			return "สอบถามราคา"
	 		end
	 	elsif is_hold
	 		return "ยังไม่เปิดขาย"
	 	else
	 		return "ขายแล้ว"
	 	end
	end
end
