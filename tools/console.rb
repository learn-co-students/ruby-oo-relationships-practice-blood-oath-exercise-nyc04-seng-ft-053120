require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
# just in case pry is buggy and exits

#binding.pry
puts "Mwahahaha!" # just in case pry is buggy and exits



c1 = Cult.new("Flatiron", "NYC", 2012, "Love code")
c2 = Cult.new("Foodies", "Brooklyn", 2013, "FoodFood")
c3 = Cult.new("Astorians", "Queens", 2000, "WeDaBest")

f1 = Follower.new("Francisco", 30, "Chilling")
f2 = Follower.new("Donat", 31, "Coding")
f3 = Follower.new("Barbs", 20, "Yooooo")

#bo1 = BloodOath.new(2020-01-20)
#bo2 = BloodOath.new(2013-04-10)


c1.recruit_follower(f1)
c2.recruit_follower(f3)
c1.recruit_follower(f3)


binding.pry 
