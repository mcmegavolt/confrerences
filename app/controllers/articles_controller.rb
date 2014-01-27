class ArticlesController < InheritedResources::Base

	def permitted_params
  	params.permit(:article => [:title, :entry, :author, :category_id, :file])
	end

end
