require 'pry'
class Cult
    attr_reader :name, :location, :founding_year, :slogan 
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location 
        @founding_year = founding_year
        @slogan = slogan 
        @@all << self 
    end

    #takes in an argument of a Follower instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == self && blood_oaths.follower == follower }
        BloodOath.new(self, follower)
        follower.cults.push(self)
        else 
        "#{follower.name} is part of this cult."
        end 
       
    end

    #returns an Integer that is the number of followers in this cult
    def cult_population
        BloodOath.all.select { |current_cult| current_cult.cult == self }.count 
    end

    def self.all
        #binding.pry 
        @@all 
    end

    #takes a String argument that is a name and returns a Cult instance whose name matches that argument
    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name }
    end

    #akes a String argument that is a location and returns an Array of cults that are in that location
    def self.find_by_location(place)
        self.all.select { |locations| locations.location == place }
    end

    #takes an Integer argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(num)
        self.all.select { |year| year.founding_year == num}
    end
end
