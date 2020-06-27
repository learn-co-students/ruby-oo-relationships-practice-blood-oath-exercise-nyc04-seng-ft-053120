require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = Cult.new("Death","florida","it's inevitable",2012)
c2 = Cult.new("life", "NY","news", 2020)
c3 = Cult.new("food", "NY", "food is life", 1997)
c4 = Cult.new("drink", "MI", "drink til you're dead", 2002)

f1 = Follower.new("sally",19, "This is my season")
f2 = Follower.new("Dave", 30, "I don't know")
f3 = Follower.new("paul", 15, "i'm young and idc!")
f4 = Follower.new("sarah", 16, "bitches aint shit")
f5 = Follower.new("jessica", 21, "broccoli")
f6 = Follower.new("steven", 46, "piano")
f7 = Follower.new("tracy", 12, "run")
f8 = Follower.new("jovan", 27, "strawberry")
f9 = Follower.new("teresa", 32, "laugh")
f10 = Follower.new("dan", 60, "cry")
f11 = Follower.new("amanda", 19, "game")
f12 = Follower.new("ariel", 28, "cat")
f13 = Follower.new("kevin", 30, "meatballs")
f14 = Follower.new("sue", 42, "YOLO")

#top ten [f2(6), f1(5), f4(4), f6(3), f7(2), f3(1), f9(1), f8(1), f5(1), f10(1)]

b1 = Bloodoath.new(c1,f2)
b2 = Bloodoath.new(c1, f2)
b3 = Bloodoath.new(c3, f2)
b4 = Bloodoath.new(c3, f2)
b5 = Bloodoath.new(c3, f2)
b6 = Bloodoath.new(c3, f2)
b7 = Bloodoath.new(c3, f1)
b8 = Bloodoath.new(c3, f1)
b9 = Bloodoath.new(c3, f1)
b10 = Bloodoath.new(c3, f1)
b11 = Bloodoath.new(c3, f1)
b12 = Bloodoath.new(c3, f4)
b13 = Bloodoath.new(c3, f4)
b14 = Bloodoath.new(c3, f4)
b14 = Bloodoath.new(c3, f4)
b14 = Bloodoath.new(c3, f6)
b14 = Bloodoath.new(c3, f6)
b14 = Bloodoath.new(c3, f6)
b14 = Bloodoath.new(c3, f7)
b14 = Bloodoath.new(c3, f7)
b14 = Bloodoath.new(c3, f3)
b14 = Bloodoath.new(c3, f9)
b14 = Bloodoath.new(c3, f8)
b14 = Bloodoath.new(c3, f5)
b14 = Bloodoath.new(c3, f10)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits

# name,location,slogan,founding_year)
# name, age, life_motto
# cult, follower