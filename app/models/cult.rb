class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
    @@all=[]
    def initialize(name,location,founding_year,slogan,minimum_age)
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @minimum_age=minimum_age
        @@all<<self
    end

    def recruit_follower(follower)
        if follower.age>=self.minimum_age
        BloodOath.new(self,follower)
        else
            "Sorry! #{follower.name} doesn't have minimum age."
        end
    end
    def cult_population
        population=BloodOath.all.select {|bo| bo.cult.name==self.name}
        population.length
    end
    def average_age
        followers=BloodOath.all.map {|bo| bo.follower.age if bo.cult.name==self.name}
       sum=0
       followers.each do |x|
        if x!=nil
            sum+=x
        end
        end
       count=followers.length
       average=(sum.to_f/count.to_f).round(2)
    end

    def my_followers_mottos
        followers=BloodOath.all.map {|bo| bo.follower.life_motto if bo.cult.name==self.name}
       followers.each do |x|
        puts x
       end

    end
    
    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population
        end
    end

    def self.most_common_location
        location=self.all.map {|cult| cult.location}
        location.max_by do |x| 
            location.count(x)
        end
    end

    def self.find_by_name(name)
        Cult.all.find {|c| c.name==name}
    end
    def self.find_by_location(location)
        Cult.all.select {|c| c.location==location}
    end
    def self.find_by_founding_year(year)
        Cult.all.select {|c| c.founding_year==year}
    end



    def self.all
        @@all
    end



end

