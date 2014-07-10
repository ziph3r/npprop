class Backend::NewsController < ApplicationController
	layout 'backend'
	def index
		params[:page] ||= 1
		condition_str = " true "
		args = []
		if params[:search]
			if params[:search][:keyword] && !params[:search][:keyword].strip.empty?
				condition_str += " and lower(news.title) like ? "
				args << "%#{params[:search][:keyword].downcase}%"
			end
		end

		@newses = News.where([condition_str, *args])
		.all
		.order("news.updated_at desc")	
		.paginate(:page => params[:page])		
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new(news_params)
		if @news.valid?
			@news.save

			redirect_to backend_news_index_path
		else
			render :new
		end
	end

	def edit
		@news = News.find(params[:id])
	end

	def update
		@news = News.find(params[:id])

		if @news.update_attributes(news_params)
			redirect_to backend_news_index_path
		else
			render :edit
		end
	end

	def destroy
		@news = News.find(params[:id])
		@news.destroy
		redirect_to backend_news_index_path
	end

	private
	def news_params
		params.require(:news).permit(
			:title,
			:short_desc,
			:cover_id,
			:content,
			:is_publish
		)
	end
end
