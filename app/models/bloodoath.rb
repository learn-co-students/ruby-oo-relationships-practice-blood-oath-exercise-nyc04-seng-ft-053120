require "date"

class Bloodoath
  attr_accessor :date, :cult, :follower
  @@all = []

  def initialize(cult,follower)
    @date = Date.today
    @cult = cult
    @follower = follower
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    first_bloodoath = self.all.min { |bloodoath| bloodoath.date }
    first_bloodoath.follower
  end
end