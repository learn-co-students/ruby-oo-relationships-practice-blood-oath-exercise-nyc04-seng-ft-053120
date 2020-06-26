require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

be_cult = Cult.new("Blue Eyes", "NY")
cp_cult = Cult.new("Cool Peeps", "NY")
ff_cult = Cult.new("French Fry", "Miami")

karen = Follower.new("Karen")
boomer = Follower.new("Boomer")
alvi = Follower.new("Alvi")
karen.age = 68
boomer.age = 47
alvi.age = 21

be_cult.recruit_follower(karen)
ff_cult.recruit_follower(karen)
cp_cult.recruit_follower(boomer)
cp_cult.recruit_follower(alvi)



# puts be_cult.cult_population
# puts ff_cult.cult_population

puts "BE: #{be_cult.cult_population}"
puts "FF: #{ff_cult.cult_population}"
puts "CP: #{cp_cult.cult_population}"

puts "BE: #{Cult.find_by_name("Blue Eyes")}"
puts "FF: #{Cult.find_by_name("French Fry")}"
puts "K: #{Cult.find_by_name("Karen")}"

pp Cult.find_by_location("NY")[0]
pp Cult.find_by_location("Miami")[0]

puts "NY: #{Cult.find_by_location("NY")}"
puts "Miami: #{Cult.find_by_location("Miami")}"

# puts Cult.all

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits