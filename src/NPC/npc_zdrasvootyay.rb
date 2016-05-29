require_relative 'npc.rb'

# Location: [5,4]
class Fisherman < NPC

  def initialize
    @name = "Fisherman"
  end

  def run(entity)
    print "#{@name}: "
    if (entity.has_item_by_string("Fishing Pole") == -1)
      puts "You'll need a fishing pole if you want to fish here!"
      puts "Don't forget bait! You can buy chubs at the shop in Zdasvootyay."
    else
      puts "Hohohoho! Nice fishing pole!"
      print "Want some tips for fishing? (y/n): "
      input = gets.chomp

      if (input == "y")
        puts "Good! The most important thing to remember is that"
        puts "certain locations require certain forms of bait."
        puts "For instance, the fish 'round here seem to like chubs."
        puts "Sometimes, you'll need to experiment with your bait..."
        puts "And you may not always catch a fish, but"
        puts "remember that practice makes perfect."
        puts "Oh yeah, and you can sell or cook your fish!"
      else
        puts "You must be an expert! Goodbye!"
      end
    end
  end
end

# Location: [5,2]
class Fisherwoman < NPC
  def initialize
    @name = "Fisherwoman"
  end

  def run(entity)
    print "#{@name}: "
    puts "This is my territory!"
    puts "Don't even think about casting your line here!"
  end
end
