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
        self.all.find {|cult| cult.name == name }
    end

  def self.find_by_location(location)
      self.all.find_all {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
      self.all.find_all {|cult| cult.founding_year == year}
  end 

  def average_age
    sum_all_followers_age = self.followers.reduce(0) { |sum, follower| sum + follower.age }
    total_followers = self.followers.size

    sum_all_followers_age * 1.0 / total_followers
  end

  def my_followers_motto
    self.followers.map { |follower| follower.life_motto }
  end

  def self.least_popular
    smallest_num_followers = 0
    cult_with_smallest_num_followers = ''

    self.all.each_with_index do |cult, idx|
      if cult.followers.size < smallest_num_followers || idx == 0
        smallest_num_followers = cult.followers.size
        cult_with_smallest_num_followers = cult
      end
    end

    cult_with_smallest_num_followers
  end

  def self.most_common_location
    location_count = Hash.new(0)

    self.all.each { |cult| location_count[cult.location] += 1 }

    location_count_sorted_ascending = location_count.sort_by { |location, count| count }
    
    location_count_sorted_ascending[-1][0]
  end
end 

