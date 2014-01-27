class Conference < ActiveRecord::Base
	

	has_many :articles, :dependent => :destroy
	accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: :all_blank

	mount_uploader :file, FileUploader


end
