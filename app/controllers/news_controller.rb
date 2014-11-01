class NewsController < FrontendsController
	layout 'frontend'
	respond_to :html, :js, :json
	def index
		params[:page] ||= 1
		@lastest_newses = News.where("is_publish = true ").all.order('created_at desc').limit(5)

		condition_str = " is_publish = true "
		args = []

		if params[:search]
			if params[:search][:s] && !params[:search][:s].strip.empty?
				condition_str += " and lower(title) like ? or lower(content) like ? "
				args << "%#{params[:search][:s].downcase}%"
				args << "%#{params[:search][:s].downcase}%"
			end
		end
		@newses = News.where(
			[condition_str, *args]
		).all.order('updated_at desc').paginate(:page => params[:page])

	end

	def show
		@news = News.find(params[:id])
		params[:page] ||= 1
		@lastest_newses = News.where("is_publish = true ").all.order('created_at desc').limit(5)
		condition_str = " is_publish = true "
		args = []

		if params[:search]
			if params[:search][:s] && !params[:search][:s].strip.empty?
				condition_str += " and lower(title) like ? or lower(content) like ? "
				args << "%#{params[:search][:s].downcase}%"
				args << "%#{params[:search][:s].downcase}%"
			end
		end
		@newses = News.where(
			[condition_str, *args]
		).all.order('updated_at desc').paginate(:page => params[:page])
	end
end
