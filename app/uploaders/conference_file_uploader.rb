# encoding: utf-8

class ConferenceFileUploader < CarrierWave::Uploader::Base

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
    date = model.start_at.day.to_s + '-' + model.end_at.day.to_s + '.' + model.start_at.month.to_s + '.' + model.start_at.year.to_s
     "conference_#{date}.#{file.extension}" if original_filename.present?
  end

end
