class Article < ActiveRecord::Base

	belongs_to :conference
	belongs_to :category

	validates_presence_of :title, :entry, :author, :category_id, :conference_id

	mount_uploader :file, FileUploader
end
