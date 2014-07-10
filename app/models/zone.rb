class Zone < ActiveRecord::Base
	has_many :products

	ARRS = [
		'กรุงเทพฯและปริมณฑล',
		'ภาคกลาง',
		'ภาคเหนือ',
		'ภาคตะวันออก',
		'ภาคตะวันออกเฉียงเหนือ',
		'ภาคตะวันตก',
		'ภาคใต้'
	]
	def to_s
		name
	end
end
