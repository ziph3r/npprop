class Inbox < ActiveRecord::Base
	self.per_page = 20
	belongs_to :product
	validates :title, presence: true
	validates :sender, presence: true
	validates :message, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
end
