require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Triad", "California", 1900, "We're the Triad!")
c2 = Cult.new("Mafia", "NYC", 1845, "We're the Mafia!")
c3 = Cult.new("Christians", "NYC", 1000, "We're Christians!")
c4 = Cult.new("Pagans", "Alabama", 1000, "We're Pagans!")

f1 = Follower.new("Johnny", 20, "Yah!")
f2 = Follower.new("Billy", 22, "Yeah!")
f3 = Follower.new("Bob", 25, "No!")
f4 = Follower.new("Ricky", 33, "Nah!")
f5 = Follower.new("Mike1", 23, "Yer!")
f6 = Follower.new("Mike2", 23, "Yer!")
f7 = Follower.new("Mike3", 23, "Yer!")
f8 = Follower.new("Mike4", 23, "Yer!")
f9 = Follower.new("Mike5", 23, "Yer!")
f10 = Follower.new("Mike6", 23, "Yer!")
f11 = Follower.new("Mike7", 23, "Yer!")

f1.join_cult(c1)
f1.join_cult(c2)
f1.join_cult(c3)
f1.join_cult(c4)

f2.join_cult(c1)
f2.join_cult(c2)
f2.join_cult(c3)

f3.join_cult(c2)

f4.join_cult(c3)

f5.join_cult(c4)
f5.join_cult(c1)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits