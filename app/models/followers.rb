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

    def self.most_active
        # has the longest cults.length!
        self.all.max_by { |follower| follower.cults.length }
    end

    def self.top_ten
        # get cults.length for all and sort and limit to 10
        # empty hash
        activity_hash = {}

        # get follower => cults.length
        self.all.each { |follower| activity_hash[follower] = follower.cults.length }
        
        # get array of arrays of sorted data from hash
        sorted_list = activity_hash.sort_by { |follower, count| count }.reverse

        # get followers into an array
        sorted_array = sorted_list.map { |array| array[0] }

        # limit array to 10
        sorted_array.take(10)
    end
    
    def bloodoaths
        Bloodoath.all.select { |bo_instance| bo_instance.follower == self }
    end

    def cults
        bloodoaths.map { |bloodoath| bloodoath.cult }
    end

    def join_cult(cult)
        Bloodoath.new(cult, self)
    end

    def my_cults_slogans
        cults.map { |cult| cult.slogan }
    end
end
