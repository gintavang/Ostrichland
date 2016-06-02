# Functions that handle the user's commands.

def help(player)
  puts "~~$$$~~Default commands~~$$$~~"
  puts "n (north); s (south);"
  puts "e (east); w (west);"
  puts "help; map; inv; use [item]"
  events = player.map.tiles[player.location.first][player.location.second].events
  if (!(events.empty?))
    puts "~~$$$~~Special commands~~$$$~~"
    events.each do |event|
      print "#{event.command}; "
    end
    print "\n"
  end
end

def print_possible_moves(player)
  y = player.location.first
  x = player.location.second
  puts "Where to?\n---------\n"
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
  events = player.map.tiles[player.location.first][player.location.second].events
  events.each do |event|
    if (event.visible && command == event.command)
      event.run(player)
      return
    end
  end
end

# Prompts the player after each move.
def prompt(player)
  events = player.map.tiles[player.location.first][player.location.second].events
  # puts tile.description
  print_possible_moves(player)
  if (!(events.empty?) && events.any? { |event| event.visible })
    puts "~~$$$~~Special commands~~$$$~~"
    events.each do |event|
      if (event.visible)
        puts "#{event.command}; "
      end
    end
  end
end
