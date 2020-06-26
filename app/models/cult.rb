class Cult

    attr_reader :name, :location, :founding_year
    attr_accessor :slogan, :followers

    @@all = []

    def initialize(name, location)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = "hey"
        @followers = []
        @@all << self
    end
    
    def recruit_follower(follower)
        @followers << follower
    end

    def cult_population
        @followers.length
    end

    def self.find_by(type, value)
        @@all.select do |cult|
            cult.instance_variable_get("@"+type) == value
        end
    end

    def self.find_by_name(name)
        self.find_by("name", name)[0]
    end

    def self.find_by_location(location)
        self.find_by("location", location)
    end

    def self.find_by_founding_year(year)
        self.find_by("founding_year", year)
    end

    def self.all
        @@all
    end
end
