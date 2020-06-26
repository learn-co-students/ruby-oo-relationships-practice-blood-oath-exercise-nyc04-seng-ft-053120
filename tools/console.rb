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

cult1.recruit_follower("Jorge")
cult2.recruit_follower("Anh")
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits