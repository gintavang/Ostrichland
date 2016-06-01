# Functions that handle the user's commands.

def help(player)
  puts "~~$$$~~Default commands~~$$$~~"
  puts "n (north); s (south);"
  puts "e (east); w (west);"
  puts "help; map; inv; use [item]"
  tile = player.map.tiles[player.location.first][player.location.second]
  if (tile.events.length > 0)
    puts "~~$$$~~Special commands~~$$$~~"
    tile.events.each do |event|
      print "#{event.command}; "
    end
    print "\n"
  end
end

def print_possible_moves(player)
  y = player.location.first
  x = player.location.second
  puts "\nWhere to?\n---------\n"
  if player.map.tiles[y - 1][x].passable
    print "north (n); "
  end

  if player.map.tiles[y][x + 1].passable
    print "east (e); "
  end

  if player.map.tiles[y + 1][x].passable
    print "south (s); "
  end

  if player.map.tiles[y][x - 1].passable
    print "west (w);"
  end
  print "\n"
end
     


def interpret_command(command, player)
  # Default commands.
  case(command)
  when "w", "e", "n", "s"
    player.move(command)
  when "help"
    help(player)
  when "map"
    player.print_player_map
  when "inv"
    player.print_inventory
  when "use"
    #not sure how use [item] will work yet.
  end

  # Other commands.
  tile = player.map.tiles[player.location.first][player.location.second]
  tile.events.each do |event|
    if (command == event.command)
      event.run(player)
      return
    end
  end
end

# Prompts the player after each move.
def prompt(player)
  tile = player.map.tiles[player.location.first][player.location.second]
  puts tile.description
  if (tile.events.length > 0)
    puts "~~$$$~~Special commands~~$$$~~"
    tile.events.each do |event|
      puts "#{event.command}; "
    end
  end
  print_possible_moves(player)
end
