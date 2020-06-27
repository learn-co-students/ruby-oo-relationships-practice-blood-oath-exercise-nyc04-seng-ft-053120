class Cult
  attr_accessor :name, :location, :slogan, :founding_year
  @@all = []

  def initialize(name, location, slogan, founding_year)
    @name = name
    @location = location
    @slogan = slogan 
    @founding_year = founding_year
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|cult_instance| cult_instance.name == name}
  end

  def self.find_by_location(location)
    self.all.select { |cult_instance| cult_instance.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult_instance| cult_instance.founding_year == year }
  end

  def self.least_popular
    # what if a cult has no followers?
    # num of followers found through cult population

    # followers = nil
    # self.all.each { |cult| 
    #   if followers == nil
    #     followers = cult.cult_population
    #   elsif cult.cult_population < followers
    #     followers = cult.cult_population
    #   end
    # }
    # self.all.select { |cult| cult.cult_population == followers }

    self.all.min_by { |cult| cult.cult_population }
  end

  def self.most_common_location
    # get all locations
    locations = self.all.map { |cult| cult.location }
    # find most frequent occuring location 
    locations.max_by { |location| locations.count(location) }
  end

  ## Flatiron Solution Below! ##
  # solution made a hash that counted location frequencies (florida => 1, NY => 2) and then sorted by max number and returned that location

  # def self.cult_locations
  #   locations = {}
  #   self.all.each do |cult|
  #     if !locations[cult.location]
  #       locations[cult.location] = 1
  #     else
  #       locations[cult.location] += 1
  #     end
  #   end
  #   return locations
  # end

  # def self.most_common_location
  #   # this returns an array!
  #   location = cult_locations.max_by do |location, count|
  #     count
  #   end
  #   location[0]
  # end

  def bloodoaths
    Bloodoath.all.select { |bloodoath| bloodoath.cult == self }
  end

  def followers
    bloodoaths.map { |bloodoath| bloodoath.follower }
  end

  def recruit_follower(follower)
    Bloodoath.new(self,follower)
  end

  def cult_population
    followers.count
  end

  def average_age
    sum_of_ages = followers.sum { |follower| follower.age }
    sum_of_ages / cult_population
  end

  def my_followers_mottos # deliverables says prints out, but solution returns an array of mottos
    followers.each { |follower| puts follower.life_motto }
  end
end