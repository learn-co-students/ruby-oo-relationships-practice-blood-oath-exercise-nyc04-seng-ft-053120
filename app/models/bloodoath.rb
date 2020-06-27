class BloodOath
  attr_reader :follower, :cult, :initiation_date

  @@all = []

  def initialize(follower, cult)
    @follower = follower
    @cult = cult
    @initiation_date = Time.now.strftime("%Y-%m-%d")

    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    self.all.sort_by { |blood_oath| blood_oath.initiation_date }[0]
  end
end