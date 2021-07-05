require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("Vamps", "NYC", 2020, "Vampires for life")
cult2 = Cult.new("Catoholic", "Brooklyn", 2019, "MEOW")
cult3 = Cult.new("Dogaholics", "BRONX", 2019, "Laugh")

follower1 = Follower.new("Jorge", 29, "COFEEEEE!!!!!!!")
follower2 = Follower.new("Anh", 27, "Cool beans")

cult1.recruit_follower(follower2)
cult2.recruit_follower(follower1)

# cult1.cult_population

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits