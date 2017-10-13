require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
begin
  sam = BestFriend.new('', 1, '')
rescue ArgumentError
  puts "please enter name and favorite pastime"
end

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
