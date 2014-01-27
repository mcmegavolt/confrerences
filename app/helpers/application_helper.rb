module ApplicationHelper

	def show_conference_dates conf
		render = conf.start_at.day.to_s
		render += '&ndash;' 
		render += conf.end_at.day.to_s
		render += ' ' + l(conf.end_at, format: "%B")
		render += ', ' + conf.end_at.year.to_s
		render.html_safe
	end

end
