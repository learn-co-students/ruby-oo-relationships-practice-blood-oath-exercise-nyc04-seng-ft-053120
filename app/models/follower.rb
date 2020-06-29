class Follower
    attr_accessor :name, :age, :life_motto
    @@all=[]
    def initialize(name,age,life_motto)
        @name=name
        @age=age
        @life_motto=life_motto
        @@all<<self
    end
    def bloodoaths
        BloodOath.all.select {|bo| bo.follower==self}
    end

    def cults
        bloodoaths.map {|bo| bo.cult}
    end
    def join_cult(cult)
        if self.age>=cult.minimum_age
        BloodOath.new(cult,self)
        else
            "Sorry! You are too young to join the cult"
        end
    end
    def my_cults_slogans
        cults.map do |cult|
          cult.slogan
        end  
    end
    def fellow_cult_members
        followers=[]
        BloodOath.all.each do |bo|
        cults.each do |c|
            if bo.cult==c
                followers<<bo.follower
            end
        end
        end
        fellow=followers.uniq.select {|f| f!=self}

    end

    def self.most_active
        self.all.max_by do |x|
            x.cults.count
        end
    end
    def self.top_ten
        self.all.max_by(10) do |x|
            x.cults.count
        end
    end
    def self.all
        @@all
    end
    def self.of_a_certain_age(age)
        Follower.all.select {|f| f.age>=age}
    end









    
end