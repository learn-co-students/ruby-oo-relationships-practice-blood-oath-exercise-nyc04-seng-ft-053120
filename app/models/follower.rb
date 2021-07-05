class Follower

    attr_reader :name, :age, :life_motto, :cults

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        self.bloadoaths.map {|bloadoath| bloadoath.cult }
    end

    def bloadoaths
        BloadOath.all.select {|bloadoath| bloadoath.follower == self } 
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age }
    end

end