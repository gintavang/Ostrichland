require_relative 'event.rb'
require_relative '../Item/food.rb'

class Plant < Event

  def initialize
    super
    @command = "pick"
  end

  def run(entity)
    if (@number > 0)
      print "You pick a #{@fruit.name}.\n\n"
      entity.add_item(@fruit, 1)
      @number -= 1
    else
      print "There are no fruits left here!\n\n"
    end
  end

  # Determines the type of fruit (Food) and the
  # remaining number left on this plant.
  attr_accessor :fruit, :number

end

class BananaTree < Plant
  def initialize
    super
    @fruit = Banana.new
    @number = 5
  end
end

class BananaDictionaryTree < BananaTree
  def initialize
    super
  end

  def run(entity)

    case (@mode)
    when 0
      if (@number == 0) then @mode = 1 end
      super
    when 1
      puts "As you greedily stare up into the now-bananaless tree,"
      puts "you hear a loud crack, and a massive book"
      print "crashes down on your head.\n\n"
      print "When you regain your wits, you read the cover:\n\n"
      puts "'Russian to English Dictionary'\n\n"
      puts "It's not likely you'll need something like that,"
      print "But hey, you might find some use for it at some point.\n\n"
      entity.add_item(RussianDictionary.new, 1)
      @mode = 2
    when 2
      super
    end
  end

end
