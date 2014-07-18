class News < ActiveRecord::Base
	self.per_page = 3
	belongs_to :image, :foreign_key => 'cover_id'
	validates :title, presence: true
	validates :content , presence: true
end
