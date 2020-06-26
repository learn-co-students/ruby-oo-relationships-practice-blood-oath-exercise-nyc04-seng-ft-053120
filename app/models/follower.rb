# frozen_string_literal: true

require 'pry'

class Follower
  attr_reader :name, :age, :life_motto
  attr_accessor :cult

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def cults
    BloodOath.all.map(&:cult)
  end

  def join_cult(cult)
    BloodOath.new(self, cult)
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age >= age }
  end

  def my_slogans
    cults.map(&:slogan).uniq
  end

  def self.most_active
    self.all.max_by(&:name)
  end

  def self.top_ten
    self.all.max_by(10, &:name)
  end
end
