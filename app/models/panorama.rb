class Panorama < ActiveRecord::Base
  before_save :set_photos_order

  attr_accessor(:image_order) { [] }

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  belongs_to :user

  def set_photos_order
    # ie. ['file2,png', 'file1.jpg', ..]
    self.image_order = JSON.parse image_order
    self.image_order.map! { |file_name| file_name.gsub(/\s/, '_') }

    photos.each do |photo|
      photo_name = photo.file.filename
      new_position = image_order.index photo_name
      photo.position_number = new_position
    end
  end

  def ordered_photos
    photos.sort_by &:position_id
  end
end
