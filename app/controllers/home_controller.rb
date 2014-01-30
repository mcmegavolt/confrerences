class HomeController < ApplicationController

	def last_conference
		Conference.last
	end
	helper_method :last_conference

end
