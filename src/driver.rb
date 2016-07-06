require_relative "command.rb"

def run_driver(player)
  system("clear")

  prompt(player)
  input = player_input

  while (input != "q")
    interpret_command(input, player)
    input = player_input
  end

end

def player_input
  print "> "
  input = gets.chomp
  puts "\n"
  return input
end
