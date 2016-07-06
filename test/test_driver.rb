require_relative '../src/command.rb'
require_relative '../src/Entity/player.rb'

# Set the Player's status variables.
player = Player.new("Player1", 5, 1)

# Set the Player's Map.
player.map = Zdrasvootyay.new

# Set the Player's Location.
player.location = Couple.new(1,5)

# Set the Player's Inventory
player.inventory = [Couple.new(Stick.new, 1), Couple.new(Pillow.new, 1)]

# Set the Player's Gold.
player.gold = 100

prompt(player)
print "> "
input = gets.chomp
puts "\n"

while (input != "q")
  interpret_command(input, player)
  print "> "
  input = gets.chomp
  puts "\n"
end
