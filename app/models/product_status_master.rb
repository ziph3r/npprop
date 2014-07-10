class ProductStatusMaster < ActiveRecord::Base
	has_many :product
	SELL_ID = 1
	HOLD_ID = 3
	ARRS = [
		"พร้อมขาย",
		"ขายแล้ว",
		"ยังไม่ขาย"
	]

	def to_s
		name
	end
end
