print "1. Ban\n2. Kick\n: "
user_input = gets.chomp

case user_input
when "1"
    require_relative './ban.rb'
when "2"
    require_relative './kick.rb'
else
    puts "Invalid input"
end