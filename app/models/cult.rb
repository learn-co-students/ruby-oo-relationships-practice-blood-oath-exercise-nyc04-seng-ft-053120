class Cult
  attr_reader :name, :location, :founding_year, :slogan, :followers

  @@all  = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @followers = []

    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(follower, self)
    @followers << follower
  end

  def cult_population
    BloodOath.all.count { |blood_oath| blood_oath.cult == self }
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    blood_oath = BloodOath.all.find { |blood_oath| blood_oath.cult.name == name }

    blood_oath.cult
  end

  def self.find_by_location(location)
    blood_oaths = BloodOath.all.find_all { |blood_oath| blood_oath.cult.location == location }

    blood_oaths.map {|blood_oath| blood_oath.cult}.uniq
  end

  def self.find_by_founding_year(founding_year)
    blood_oaths = BloodOath.all.find_all { |blood_oath| blood_oath.cult.founding_year == founding_year }
    blood_oaths.map {|blood_oath| blood_oath.cult}.uniq
  end

  def average_age
    # returns a float that is the avg age of this cult's followers
    self.followers.sum(0.0) / self.followers.size
  end
end 