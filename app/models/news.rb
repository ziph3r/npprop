class News < ActiveRecord::Base
	self.per_page = 10
	belongs_to :image, :foreign_key => 'cover_id'
	validates :title, presence: true
	validates :content , presence: true
end
