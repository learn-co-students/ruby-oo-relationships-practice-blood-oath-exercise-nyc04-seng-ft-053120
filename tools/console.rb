require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult_1 = Cult.new("Cosmo Cult", "California", 1777, "Exploring the Universe")
cult_2 = Cult.new("Donuts Cult", "NYC", 1964, "YOLO")
cult_3 = Cult.new("Pizza Cult", "NYC", 1968, "The Most Delicious Cult")

follower_1 = Follower.new("George", 35, "Keep Coding")
follower_2 = Follower.new("Kelsey", 35, "Don't Stop Believin")
follower_3 = Follower.new("Alvee", 1, "Git Fat")

# bloodoath_1 = BloodOath.new(follower_1, cult_1)
# follower_1.follow_cult(cult_1)
cult_1.recruit_follower(follower_1)
cult_1.recruit_follower(follower_2)
cult_2.recruit_follower(follower_3)
cult_3.recruit_follower(follower_3)

# Print an array of a specific cult's bloodoaths
puts "Cult 1 - Cosmo Cult"
puts cult_1.bloodoaths #=> [instance of George, instance of Kelsey]
puts "Cult 2 - Donut Cult"
puts cult_2.bloodoaths #=> [instance of Alvee]


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits