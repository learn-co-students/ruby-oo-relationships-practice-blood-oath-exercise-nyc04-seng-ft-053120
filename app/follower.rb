require 'pry'
class Follower
    attr_accessor :cults, :age
    attr_reader :name, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @cults = []
        @life_motto = life_motto 
        @@all << self 
    end

    #takes in an argument of a Cult instance and adds this follower to the cult's list of followers
    def join_cult(cult)
        if !BloodOath.all.find {|blood_oaths| blood_oaths.cult == cult && blood_oaths.follower == self }
        BloodOath.new(cult, self)
        self.cults << cult 
    else 
        "You are already part of #{cult.name}."
        end 
    end

    def self.all
        @@all
    end

    #takes an Integer argument that is an age and returns an Array of followers who are the given age or older
    def self.of_a_certain_age(age)
        
    end
end