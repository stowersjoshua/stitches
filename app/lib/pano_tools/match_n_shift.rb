require_relative 'match_n_shift/input_csv_gen'

module PanoTools
  class MatchNShift
    
    def initialize(photos)
      @photos = photos
    end
  
    def generate_pto!
      PtoFile.new
    end
  end
end
