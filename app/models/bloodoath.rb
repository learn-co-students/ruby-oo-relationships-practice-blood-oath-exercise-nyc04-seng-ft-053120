class BloodOath
    attr_reader :initiation_date

    def initialize(initiation_date)
        @initiation_date = initiation_date
    end

    def self.all
        blood_oath_array = []
        Follower.all.each do |follower_instance|
            if follower_instance.blood_oath
            blood_oath_array <<follower_instance.blood_oath 
            end
        end
        blood_oath_array
    end
    
end