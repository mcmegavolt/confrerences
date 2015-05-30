class Conference < ActiveRecord::Base

	translates :title, :description

	has_many :articles, :dependent => :destroy
	accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: :all_blank

	has_many :categories, :through => :articles
	
	has_many :advertisings

	validates_presence_of :title, :start_at, :end_at

	mount_uploader :file, ConferenceFileUploader
	mount_uploader :picture, PictureUploader

	default_scope order('end_at DESC')

	def has_not_yet_started?
		Time.zone.now < self.start_at
	end

end
