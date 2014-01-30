class Conference < ActiveRecord::Base

	has_many :articles, :dependent => :destroy
	accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: :all_blank

	has_many :categories, :through => :articles

	validates_presence_of :title, :description, :start_at, :end_at

	mount_uploader :file, FileUploader
	mount_uploader :picture, PictureUploader

end
