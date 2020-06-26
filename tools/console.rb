require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = Cult.new("Death","florida","it's inevitable",2012)
c2 = Cult.new("life", "NY","news", 2020)
f1 = Follower.new("sally",19, "This is my season")
f2 = Follower.new("Dave", 30, "I don't know")
b1 = Bloodoath.new(c1,f1)
binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits

#name,location,slogan,founding_year)
# (name, age, life_motto)