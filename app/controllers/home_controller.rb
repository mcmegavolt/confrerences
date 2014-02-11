class HomeController < ApplicationController

	def last_conference
		Conference.first
	end
	helper_method :last_conference

end
