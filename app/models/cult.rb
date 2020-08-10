require 'pry'

class Cult 

    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize name, location, founding_year, slogan
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name name
        all.find {|cult| cult.name == name }
    end

    def self.find_by_location location
        all.select { |cult| cult.location == location}
    end
    
    def self.find_by_founding_year year
        all.select { | cult| cult.founding_year == founding_year}
    end

    def self.cult_slogan slogan
        all.select { |cult| cult.slogan == slogan }
    end
    
    def recruit_follower follower, initiation_date
        BloodOath.new follower, self, initiation_date
    end

    def cult_population
        BloodOath.all.select { |bloodoath| bloodoath.cult == self }.count
    end

    def followers
        bloodoaths = BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end
    end
end