class Follower
  attr_reader :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name 
    @age = age 
    @life_motto = life_motto
    @@all << self
  end

  def join_cult(cult)
    if self.age >= cult.minimum_age
      BloodOath.new(self, cult)
    else
      return "You're too young to enjoy the party."
    end
  end

  def bloodoaths
    BloodOath.all.select { |bloodoath| bloodoath.follower == self }
  end

  def cults
    self.bloodoaths.map { |bloodoath| bloodoath.cult }
  end

  def my_slogans
    self.cults.map { |cult| cult.slogan }
  end

  def has_common_cults?(other_follower)
    if self != other_follower
      (self.cults & other_follower.cults) != []
    else
      false
    end
  end

  def fellow_cult_members
    Follower.all.select { |follower| self.has_common_cults?(follower) }
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age >= age }
  end

  def self.follower_cult_count
    follower_count = Hash.new(0)
    self.all.each { |follower| follower_count[follower] = follower.cults.length }
    follower_count
  end

  def self.follower_cult_count_sorted
    self.follower_cult_count.sort_by { |follower, count| count }
  end

  def self.most_active
    self.follower_cult_count.max_by { |follower, val| val }[0]
  end

  def self.top_ten
    self.follower_cult_count_sorted[0..10]
        .reverse
        .map { |follower_count_pair| follower_count_pair[0] }
  end

  def self.all 
    @@all
  end
end