require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

f1 = Follower.new('follower1', 20, 'motto1')
f2 = Follower.new('follower2', 20, 'motto2')
f3 = Follower.new('follower3', 20, 'motto3')

c1 = Cult.new('cult1', 'Brooklyn', 2021, 'slogan1')
c2 = Cult.new('cult2', 'Manhattan', 2022, 'slogan2')
c3 = Cult.new('cult3', 'Queens', 2023, 'slogan3')


c1.recruit_follower(f1)
c1.recruit_follower(f2)
c2.recruit_follower(f1)
c2.recruit_follower(f2)
c3.recruit_follower(f1)
c3.recruit_follower(f2)
c3.recruit_follower(f3)

binding.pry
BloodOath.all
# b1 = BloodOath.new(f1, c1)
# b2 = BloodOath.new(f1, c2)
# b3 = BloodOath.new(f2, c1)
# b4 = BloodOath.new(f2, c2)
# b5 = BloodOath.new(f2, c3)
# b6 = BloodOath.new(f3, c1)
# b7 = BloodOath.new(f3, c2)
# b8 = BloodOath.new(f3, c3)


puts "Mwahahaha!" # just in case pry is buggy and exits