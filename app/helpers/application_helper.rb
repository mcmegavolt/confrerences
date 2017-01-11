module ApplicationHelper
	def show_conference_dates(conf)
		render = conf.start_at.day.to_s
		unless conf.one_day?
			render += '&ndash;'
			render += conf.end_at.day.to_s
		end
		render += ' ' + l(conf.end_at, format: '%B')
		render += ', ' + conf.end_at.year.to_s
		render.html_safe
	end
end
