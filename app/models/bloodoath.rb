require 'time' 

class BloodOath
  attr_reader :follower, :cult, :initiation_date

  @@all = []

  def initialize(follower, cult)
    @follower = follower 
    @cult = cult
    @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    @@all << self
  end

  def self.first_oath
    first_oath = self.all.min_by { |bloodoath|  Time.parse(bloodoath.initiation_date) }
    first_oath.follower
  end

  def self.all
    @@all
  end
end