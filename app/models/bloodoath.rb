class BloodOath
    attr_accessor :initiation_date, :cult, :follower
    @@all=[]
    def initialize(cult,follower)
        @initiation_date="#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @cult=cult
        @follower=follower
        @@all<<self
    end
    def self.all
        @@all
    end
    def self.first_oath
        self.all[0].follower
    end








end
