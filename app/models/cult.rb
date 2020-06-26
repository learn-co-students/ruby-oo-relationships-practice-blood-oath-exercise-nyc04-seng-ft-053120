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
    
    def followers
        Bloodoath.all.select{|oath| oath.cult == self}
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


    def average_age
        cult_average_age = 0
        followers.each {|oath| cult_average_age += oath.follower.age}
        (cult_average_age/self.cult_population).to_f
    end

    def my_followers_mottos
        followers.map {|oath| oath.follower.life_motto}
    end

    def self.least_popular
        Cult.all.sort_by{|cult|cult.cult_population}[0]
    end

    def self.most_common_location
        locations = {}
        self.all.each do |cult|
            if locations[cult.location]
                locations[cult.location] += 1
            else locations[cult.location] = 1
            end
        end
        
        locations.sort_by do |location, value|
            value
        end.last[0]
    end

    
end