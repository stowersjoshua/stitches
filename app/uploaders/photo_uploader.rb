class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  attr_accessor(:position_number) { 0 }

  storage :file

  def auto_orient
    manipulate! do |image|
      image.auto_orient
      image
    end
  end

  process :auto_orient #, :set_position

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{position_number}.#{extension}"
  end

  def extension
    return 'jpg' unless original_filename.present?
    original_filename.split('.').last
  end

  def position_id
    filename_position = /\A\d+/
    file.filename[filename_position].to_i
  end
end
