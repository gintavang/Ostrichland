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
      print "Don't forget bait! You can buy chubs at the shop in Zdasvootyay.\n\n"
    else
      puts "Hohohoho! Nice fishing pole!"
      print "Want some tips for fishing? (y/n): "
      input = gets.chomp

      if (input.casecmp("y") == 0)
        puts "\nGood! The most important thing to remember is that"
        puts "certain locations require certain forms of bait."
        puts "For instance, the fish 'round here seem to like chubs."
        puts "Sometimes, you'll need to experiment with your bait..."
        puts "And you may not always catch a fish, but"
        puts "remember that practice makes perfect."
        print "Oh yeah, and you can sell or cook your fish!\n\n"
      else
        print "\nYou must be an expert! Goodbye!\n\n"
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
    print "Don't even think about casting your line here!\n\n"
  end
end

class Soldier < NPC
  def initialize
    super
    @name = "Soldier"
  end

  def run(entity)
    print "#{@name}: "
    if (entity.weapon.nil?)
      puts "Wait! There are monsters outside the city"
      puts "walls. Be careful - you can purchase a weapon at"
      puts "The Tools. Don't forget to equip the weapon with"
      print "the 'use' command.\n\n"
    else
      print "Good day.\n\n"
    end
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
      print "\nWell, you don't speak Russian. Time to move on...\n\n"
    else
      puts "Don't buyeen a fyoul from theet stoor!"
      puts "I seal fyoul own the chip!"
      puts "I've only one geellen\n................."
      puts "But, eef theets yoor bowt at th end of the pier"
      puts "Eet should to geeting you where you are gooing"
      print "Interested? (y/n): "
      input = gets.chomp
      if (input.casecmp("y") == 0)
        puts "\nInd that well be 5 rubles, спасибо"
        if (entity.gold >= 5)
          entity.gold -= 5
          entity.add_item(Fuel.new, 1)
          puts "You shake his large, greasy hand"
          puts "And head back down the road."
          puts "You notice that, even with the gallon of fuel,"
          print "Your load feels much lighter\n\n"
          entity.remove_item(RussianDictionary.new, 1)
        else
          puts "Ой! Какой Кошмар... I should have been knowing"
          puts "you'll were broke! And eet I was right to think"
          print "you are a kozël. Пошёл на хуй!\n"
          puts "\nYou quickly high-tail it back to the road,"
          puts "as the relatively even tempered Russian fuel salesman"
          print "continues to lob obscenities and small fish at you from afar.\n\n"
        end
      else
        print "\nWill what, Are youl to doing here steel! Пошёл на хуй!\n\n"
      end
    end
  end
end
