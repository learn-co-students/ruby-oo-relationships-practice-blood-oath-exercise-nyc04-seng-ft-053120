require "date"
class Follower

    attr_reader :name 
    attr_accessor :age, :life_motto, :blood_oath

    # @@all = []

    def initialize(name)
        @name = name
        @age = age
        @blood_oath = false
        # @@all << self
    end

    def self.all
       followers_array =  Cult.all.flat_map do |cult_instance|
            cult_instance.followers
        end
        followers_array.uniq
    end
    def cults
        Cult.find_by_follower(self)
    end
    def join_cult(cult)
        self.blood_oath = BloodOath.new(Date.today.strftime("%Y-%m-%d"))
        binding.pry
        cult.recruit_follower(self)
    end
    def self.of_a_certain_age(age)
        Follower.all.select do |follower_instance|
            follower_instance.age == age
        end
    end

end