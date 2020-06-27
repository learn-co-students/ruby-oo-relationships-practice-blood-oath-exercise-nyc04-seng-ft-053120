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

  def my_cults_slogans
    self.cults.map { |cult| cult.slogan }
  end

  def self.cult_count
    follower_cult_count = Hash.new(0)
    self.all.each { |follower| follower_cult_count[follower] += follower.cults.count }
    follower_cult_count
  end

  def self.most_active
    sorted_cult_count_ascending = self.cult_count.sort_by { |follower, count| count }
    sorted_cult_count_ascending[-1][0]
  end

  def self.top_ten
    sorted_cult_count_ascending = self.cult_count.sort_by { |follower, count| count }.map { |follower_count_pair| follower_count_pair[0] }

    if sorted_cult_count_ascending.length <= 10
      return sorted_cult_count_ascending
    else 
      return sorted_cult_count_ascending[-10..-1]
    end
  end

end