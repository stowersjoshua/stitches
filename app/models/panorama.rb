class Panorama < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_one :photo
end
