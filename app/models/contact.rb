class Contact < ActiveRecord::Base
	has_many :products

	validates :name, presence: true
	validates :content , presence: true
	
	def to_s
		content
	end
end
