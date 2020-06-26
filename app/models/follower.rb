class Follower
    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    #helper
    def find_oath
        Bloodoath.all.select{|oath|oath.follower == self}  
    end
    # -------

    def cults
        find_oath.map do |oath|
            oath.cult
        end
    end

    def join_cult(cult)
        Bloodoath.new(self, cult, Time.now)
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end
  
    def my_cults_slogans
        cults.map do |cult|
            cult.slogan
        end
    end

    #helper
    def self.sorter
        self.all.sort_by do |follower|
            follower.cults.count
        end
    end
    # -----

    def self.most_active
        self.sorter.last
    end

    def self.top_ten
        sorter[0..9]
    end
  end