class Follower
  attr_reader :name, :age, :life_motto, :cults

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def blood_oaths
    BloodOath.all.select { |blood_oath| blood_oath.follower == self }
  end

  def cults
    self.blood_oaths.map { |blood_oath_instance| blood_oath_instance.cult }
  end

  def join_cult(cult)
    cult.recruit_follower(self)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age >= age }
  end
end