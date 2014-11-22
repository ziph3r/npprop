module ApplicationHelper
	def date_str(created_at)
		time_str = created_at.strftime('%H:%M')
		date_str = created_at.strftime('%d/%m/%y')
		if created_at.to_date == Date.current
			date_str = "Today"
		elsif created_at.to_date == (Date.current - 1)
			date_str = "Yesterday"
		end
		return date_str + " " + time_str
	end

	def mark(bool)
		if bool.to_s == "true"
			return "<i class = 'fa fa-check fw'></i>".html_safe
		else
			return "<i class = 'fa fa-times fw'></i>".html_safe
		end
	end
end


