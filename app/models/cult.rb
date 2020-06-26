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

  def recruit_follower(follower)
    Bloodoath.new(self,follower)
    binding.pry
  end

  def cult_population
    this_cult = Bloodoath.all.select{|bo_instance| bo_instance.cult == self    }
    this_cult.map{|x| x.follower}.count
    #binding.pry
  end
end