require_relative 'event.rb'

class GambleEvent < Event
  def initialize
    super
    @command = "gamble"
  end

  def run(entity)
    puts "Welcome to #{@name}! Feeling lucky?"
    print "Current gold in pouch: #{entity.gold}.\n\n"

    play_game(entity)
  end

  # Don't constantly update the player about how much gold
  # is in the pouch. We want the player to gamble as much
  # as possible >:)
  def play_game(entity)
    print "Cannot play an abstract game!\n\n"
  end

  # Define the reward in the play_game method.
  attr_accessor :name

end

class TopHatSlots < GambleEvent
  def initialize
    super
    @name = "Top Hat Slots"
  end

  def play_game(entity)
    puts "One roll is 5 gold."
    print "Would you like to try our slots (y/n)?: "
    input = gets.chomp

    while (input == "y")

      # Ensures the Entity has enough gold to play.
      if (entity.gold < 5)
        print "\nYou don't have enough gold! Begone!\n\n"
        return
      end

      entity.gold -= 5

      print "\nThe slots are rolling!! Good luck!\n\n"

      symbols = ["¿", "Ƿ", "Ȣ", "λ", "Ɋ" ]

      # Visually represents rolling slots.
      counter = 0
      while (counter < 100)
        first_symbol = symbols[rand(symbols.length)]
        second_symbol = symbols[rand(symbols.length)]
        third_symbol = symbols[rand(symbols.length)]

        print "#{first_symbol} #{second_symbol} #{third_symbol}"
        sleep(0.01)
        print "\r"

        counter += 1
      end

      # The result for the Entity's purposes.
      first_symbol = symbols[rand(symbols.length)]
      second_symbol = symbols[rand(symbols.length)]
      third_symbol = symbols[rand(symbols.length)]

      print "#{first_symbol} #{second_symbol} #{third_symbol}\n\n"

      # All symbols are matching.
      # Todo: What is a fair reward at this point in the game?
      if (first_symbol == second_symbol && second_symbol == third_symbol)
        puts "Wow!! We have a winner! Enjoy your reward!"
        print "Here - 50 gold!\n\n"
        entity.gold += 50
      else
        print "Well, darn! You'll probably get it next time!\n\n"
      end

      puts "One roll is 5 gold."
      print "Would you like to try our slots (y/n)?: "
      input = gets.chomp

    end
  end

end
