require_relative "command.rb"
require_relative "Entity/player.rb"

player = Player.new("Player1")

print "> "
input = gets.chomp

while (input != "q")
  interpret_command(input, player)

  print "> "
  input = gets.chomp
end
