# require 'pathname'

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def auto_orient
    Rails.logger.info '~~~~~~~~~~~~~~~~ auto orient'
    manipulate! do |image|
      image.auto_orient
      image
    end
  end


  # def set_position
  #   Rails.logger.info '~~~~~~~~~~~~~~~~ set position'
  #   binding.pry
  #   manipulate! do |image, index, options|
  #     options[:write] = { position: index }
  #     image
  #   end
  # end
  
  process :auto_orient #, :set_position

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def extension_whitelist
  #   %w(jpg JPG jpeg JPEG png PNG)
  # end
  #
  # def filename
  #   Rails.logger.info "~~~~~~~~ Reading file name for #{original_filename}"
  #   "image-#{image_id}.#{extension}"
  #   Rails.logger.info "~~~~~~~~ ID is #{image_id}"
  # end
  #
  # def image_id
  #   return 1 unless directory_exists?
  #   Pathname.new(store_dir).children.count.next
  #   Rails.logger.info "~~~~~~~~ Setting image ID for #{original_filename}"
  # end
  #
  # def directory_exists?
  #   Rails.logger.info "~~~~~~~~ Directory name: #{store_dir}"
  #   Rails.logger.info "~~~~~~~~ Directory exists? #{File.directory? store_dir}"
  #   File.directory? store_dir
  # end
  #
  # def extension
  #   return 'jpg' unless original_filename.present?
  #   original_filename.split('.').last
  # end
end
