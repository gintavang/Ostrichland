require_relative 'npc.rb'

# Location: [5,4]
class Fisherman < NPC

  def initialize
    super
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
    super
    @name = "Fisherwoman"
  end

  def run(entity)
    print "#{@name}: "
    puts "This is my territory!"
    puts "Don't even think about casting your line here!"
  end
end

# Location: [6,4]
class Russian < NPC
  def initialize
    super
    @name = "иван иванович иванов"
  end

  def run(entity)
    if (entity.has_item_by_string("Russian-English Dictionary") == -1)
      puts "Не покупать горючее из магазина!"
      puts "Я продаю горючее дешево!\n"
      puts "\nWell, you don't speak Russian. Time to move on..."
    else
      puts "Don't buyeen a fyoul from theet stoor!"
      puts "I seal fyoul own the chip!"
      puts "I've only one geellen\n................."
      puts "But, eef theets yoor bowt at th end of the pier"
      puts "Eet should to geeting you where you are gooing"
      print "Interested? (y/n): "
      input = gets.chomp
      if (input == "y")
        puts "Ind that well be 5 rubles, спасибо"
        if (entity.gold >= 5)
          entity.gold -= 5
          entity.add_item(Fuel.new, 1)
          puts "You shake his large, greasy hand"
          puts "And head back down the road."
          puts "You notice that, even with the gallon of fuel,"
          puts "Your load feels much lighter"
          entity.remove_item(RussianDictionary.new, 1)
        else
          puts "Ой! Какой Кошмар... I should have been knowing you'll were broke!"
          puts "And eet I was right to think you are a kozël. Пошёл на хуй!"
          puts "\nYou quickly high-tail it back to the road,"
          puts "as the relatively even tempered Russian fuel salesman"
          puts "continues to lob obscenities and small fish at you from afar."
        end
      else
        puts "Will what, Are youl to doing here steel! Пошёл на хуй!"
      end
    end
  end
end
