class Panorama < ActiveRecord::Base
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  belongs_to :user
end
