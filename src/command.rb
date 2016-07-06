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
  words = command.split

  # Default commands that take multiple "arguments" (words).
  if (words.size > 1)

    # Determine the name of the second "argument."
    name = words[1]
    for i in 2..(words.size - 1) do
      name << " " << words[i]
    end

    # Determine the appropriate command to use.
    case(words[0])
    when "drop"
      index = player.has_item_by_string(name)
      if (index != -1)
        # Perhaps the player should be allowed to specify
        # how many of the Item to drop.
        item = player.inventory[index].first
        player.remove_item(item, 1)
      else
        print "You can't drop what you don't have!\n\n"
      end
    when "unequip"
      player.unequip_item_by_string(name)
    when "use"
      player.use_item_by_string(name, player)
    end

  # Single-word default commands.
  else
    case(command)
    when "w", "e", "n", "s"
      player.move(command)
    when "help"
      help(player)
    when "map"
      player.print_player_map
    when "inv"
      print "Current gold in pouch: #{player.gold}.\n\n"
      puts "Your inventory:"
      player.print_inventory
    when "status"
      player.print_status
    else 
      puts "That isn't an available command at this time."
      print "Type 'help' for a list of available commands.\n\n"
    end
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
    # Use the counter so there are only 4 commands per line.
    counter = 0
    puts "~~$$$~~Special commands~~$$$~~"
    events.each do |event|
      # Print the corresponding command and increment the counter.
      if (event.visible)
        print "#{event.command}; "
        counter += 1
      end
      # Restart the counter and print a newline.
      if (counter == 4)
        counter = 0
        print "\n"
      end
    end
    # Prints the newline that should be there.
    if (counter != 0)
      print "\n"
    end
  end
  #if ((!monsters.empty?))
end
