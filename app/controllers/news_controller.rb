class NewsController < ApplicationController
	layout 'frontend'

	def index
		@newses = News.where(
			"is_publish = true "
		).all.order('updated_at desc')
	end

	def show
		@news = News.find(params[:id])
	end
end
