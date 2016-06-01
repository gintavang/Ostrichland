# Functions that handle the user's commands.

def help(player)
  puts "~~$$$~~Default commands~~$$$~~"
  puts "n (north); s (south);"
  puts "e (east); w (west);"
  puts "help; map; inv; use [item]"
  if (player.map.tiles[player.location.first][player.location.second].events.length > 0)
    puts "~~$$$~~Other commands~~$$$~~"
    player.map.tiles[player.location.first][player.location.second].events.each do |event|
      puts "#{event.command};"
    end
  end
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
  player.map.tiles[player.location.first][player.location.second].events.each do |event|
    if (command == event.command)
      event.run(player)
      return
    end
  end
end
