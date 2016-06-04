require_relative '../src/command.rb'
require_relative '../src/driver.rb'
require_relative '../src/Entity/player.rb'

# Set the Player's name.
player = Player.new("Player1")

# Set the Player's Map.
player.map = Zdrasvootyay.new

# Set the Player's Location.
player.location = Couple.new(1,5)

# Set the Player's Inventory
player.inventory = [Couple.new(Banana.new, 50)]

# Set the Player's Gold.
player.gold = 10000

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
