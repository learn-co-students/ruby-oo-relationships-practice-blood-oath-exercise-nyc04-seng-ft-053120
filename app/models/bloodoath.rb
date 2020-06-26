class Bloodoath
    attr_reader :follower, :cult, :initiation_date
    @@all = []

    def initialize(follower, cult, initiation_date)
        @follower = follower
        @cult = cult
        @initiation_date = initiation_date
        save    
    end

    def save
        self.class.all << self    
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.first
    end
end