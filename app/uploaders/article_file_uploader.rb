# encoding: utf-8

class ArticleFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
  	file_name = I18n.transliterate(model.author).slice(/\w+/).downcase
  	category = I18n.transliterate(model.category.title).slice(/\w+/).downcase
  	date = model.conference.start_at.day.to_s + '-' + model.conference.end_at.day.to_s + '.' + model.conference.start_at.month.to_s + '.' + model.conference.start_at.year.to_s
     "#{file_name}_#{category}_#{date}.#{file.extension}" if original_filename.present?
  end

end
