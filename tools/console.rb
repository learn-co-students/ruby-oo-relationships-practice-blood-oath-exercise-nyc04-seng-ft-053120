require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Vamps", "NYC", 2020, "Vampires for life")
cult2 = Cult.new("Catholics", "NJ", 2019, "Meow")
cult3 = Cult.new("Whatever", "NJ", 2019, "boop!")

follower1 = Follower.new("Anh", 27, "yolo")
follower2 = Follower.new("Lulu", 5, "I'm a cat!")
follower3 = Follower.new("Dao", 21, "ahhh")

cult1.recruit_follower(follower1)
cult2.recruit_follower(follower1)
cult3.recruit_follower(follower1)

cult1.recruit_follower(follower2)
cult2.recruit_follower(follower2)

cult3.recruit_follower(follower3)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits