require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

c1=Cult.new("french","france",2020,"good",41)
c2=Cult.new("german","germany",1990,"better",44)

f1=Follower.new("maria",40,"bad")
f2=Follower.new("alby",43,"worse")

bo1=BloodOath.new(c1,f1)
bo2=BloodOath.new(c1,f2)
bo3=BloodOath.new(c2,f2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits