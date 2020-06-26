class Cult
    attr_accessor  :slogan, :cult_population 
    attr_reader  :name, :location, :founding_year
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        Bloodoath.new(follower, self, Time.now)
    end

    def find_oaths
        Bloodoath.all.select{|oath| oath.cult == self}
    end
    
    def followers
        find_oaths.map do |oath|
            oath.follower
        end
    end

    def cult_population
        followers.count 
    end

    def self.find_by_name(name)
        self.all.select {|cult|cult.name == name}
    end

    def self.find_by_location(location)
        self.all.find{|cult|cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.find{|cult|cult.founding_year == founding_year}
    end

    # helper
    def total_age
        followers.inject(0) do |total, follower|
            total + follower.age
        end
    end
    # --------

    def average_age
        total_age/cult_population.to_f
    end

    def my_followers_mottos
        followers.map {|follower| follower.life_motto}
    end

    def self.least_popular
        self.all.sort_by{|cult|cult.cult_population}.first
    end

    # helper
    def self.locations_by_count
        locations = {}
        self.all.each do |cult|
            if locations[cult.location]
                locations[cult.location] += 1
            else locations[cult.location] = 1
            end
        end
        locations
    end
    # ------

    def self.most_common_location
        self.locations_by_count.sort_by do |location, count|
            count
        end.last[0]
    end

    
end