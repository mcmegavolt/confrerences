class Category < ActiveRecord::Base

	translates :title

	has_many :articles, :dependent => :destroy
	has_many :conferences, :through => :articles
	accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: :all_blank

	validates_presence_of :title

	mount_uploader :icon, IconUploader
	mount_uploader :picture, PictureUploader

end
