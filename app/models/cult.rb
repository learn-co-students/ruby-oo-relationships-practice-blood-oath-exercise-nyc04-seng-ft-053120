class Cult
  attr_reader :name,:location, :founding_year, :slogan, :minimum_age

  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age=18)
    @name = name 
    @location = location 
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age

    @@all << self
  end

  def recruit_follower(follower)
    if follower.age >= self.minimum_age
      BloodOath.new(follower, self) 
    else
      return "Minor panic"
    end
  end

  def bloodoaths
    BloodOath.all.select do |bloodoath|
      bloodoath.cult == self
    end
  end

  def followers
    self.bloodoaths.map { |bloodoath| bloodoath.follower }
  end

  def cult_population
    self.followers.length
  end

  def average_age
    cult_followers = self.followers
    age_total = cult_followers.reduce(0) { |sum, follower| sum += follower.age }
    age_total.fdiv(cult_followers.length)
  end

  def my_followers_mottos
    self.followers.map { |follower| follower.mottos }.uniq
  end

  def self.find_by_name(name)
    self.all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult| cult.founding_year == year }
  end

  def self.least_popular
    self.all.min_by { |cult| cult.followers.length }
  end

  def self.cult_locations
    cult_locations = Hash.new(0)
    self.all.each { |cult| cult_locations[cult.location] += 1 }
    return cult_locations
  end

  def self.most_common_location
    self.cult_locations.max_by { |location, count| count }[0]
  end

  def self.all
    @@all
  end
end