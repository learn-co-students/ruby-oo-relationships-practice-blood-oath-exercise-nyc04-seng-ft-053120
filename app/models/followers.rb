class Follower

    attr_accessor :name, :age, :life_motto
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

    def self.of_a_certain_age(age)
         self.all.select { |follower_instance| follower_instance.age >= age }
    end

    def cults
        #binding.pry
        f = Bloodoath.all.select { |bo_instance| bo_instance.follower == self }
        f.map { |bloodoath| bloodoath.cult }
    end

    def join_cult(cult)
        #binding.pry
        Bloodoath.new(cult, self)
    end
end
