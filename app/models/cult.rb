# frozen_string_literal: true

require 'pry'

class Cult
  attr_reader :name, :location, :founding_year, :slogan
  attr_accessor :follower

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def followers
    BloodOath.all.map(&:follower)
  end

  def recruit_follower(follower)
    BloodOath.new(follower, self)
  end

  def cult_population
    followers.length
  end

  def self.find_by_name(cult)
    self.all.find { |cult| cult.name == cult }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(founding_year)
    self.all.select { |cult| cult.founding_year == founding_year }
  end

  def average_age
    ages = followers.reduce(0) { |sum, follower| sum + follower.age }
    ages / followers.length.to_f
  end

  def my_followers_mottos
    followers.each { |follower| puts follower.life_motto }
  end

  def self.least_popular
    self.all.min_by(&:follower).name
  end

  def self.most_common_location
    self.all.max_by(&:location).location
  end
end
