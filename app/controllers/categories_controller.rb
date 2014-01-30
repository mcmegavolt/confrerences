class CategoriesController < InheritedResources::Base
	actions :show
	belongs_to :conference
end
