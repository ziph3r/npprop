class News < ActiveRecord::Base
	belongs_to :image, :foreign_key => 'cover_id'
	validates :title, presence: true
	validates :content , presence: true
end
