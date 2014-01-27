class Article < ActiveRecord::Base

	belongs_to :conference

	mount_uploader :file, FileUploader
end
