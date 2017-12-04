# require_relative 'pano_tools/'
#
# module PanoTools
#   class Base
#     attr_reader :pto_file
#
#
#   end
# end
#
#
#
# # There exists tools
# # There exist PTO files
# # Tools leave their mark on an instance of a PTO file
# # PTO files are project files and should be portable?
#
# # Store resources on a given server
#
#
#
#
#
#
# @panorama = Panorama.last.photos # ordered
# StitchProject.new(photos: @panorama.photos).stitch_mosaic!
#
# class StitchProject
#   include PanoTools
#
#   attr_reader :pto_file
#
#   def initialize(options={})
#     @photos = options[:photos]
#   end
#
#   def stitch_mosaic!
#     # We would need to know which one has the calibration card..
#     @pto_file = MatchNShift.new(@photos).generate_pto!
#     # `match-n-shift --input job_5.csv -o project.pto --projection 0 --fov 66`
#   end
# end
#
# class PtoFile
#
# end
#
#
#
#
# @panorama = Panorama.last.photos
# StitchProject.new(photos: @panorama.photos).stitch_mosaic!
