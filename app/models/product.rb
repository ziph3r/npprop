class Product < ActiveRecord::Base
	self.per_page = 20
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
end
