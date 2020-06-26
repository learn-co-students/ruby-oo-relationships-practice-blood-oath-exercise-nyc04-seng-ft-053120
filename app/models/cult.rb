class Cult
    attr_reader :name, :location, :founding_year, :slogan, :followers

    @@all = []

    def initialize (name, location, founding_year, slogan)
        @name = name    
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []
        @@all << self
    end

    def recruit_follower(follower)
        self.followers << follower
    end

    def cult_population
        self.followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name }
    end

    def self.find_by_location(location)
        self.all.find_all {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.find_all {|cult| cult.founding_year == year}
    end

end