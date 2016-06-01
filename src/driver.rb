require_relative "command.rb"
require_relative "Entity/player.rb"

player = Player.new("Player1")

prompt(player)
print "> "
input = gets.chomp

while (input != "q")
  interpret_command(input, player)
  prompt(player)
  print "> "
  input = gets.chomp
  puts "\n"
end
