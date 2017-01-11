class Conference < ActiveRecord::Base

	translates :title, :description

	has_many :articles, dependent: :destroy

	accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: :all_blank

	has_many :categories, through: :articles

	has_many :advertisings

	validates_presence_of :title, :start_at, :end_at

	mount_uploader :file, ConferenceFileUploader
	mount_uploader :picture, PictureUploader

	default_scope order('end_at DESC')

	def not_yet_started?
		Time.zone.now < start_at
	end

	def one_day?
		start_at == end_at
	end
end
