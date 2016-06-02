require_relative 'event.rb'
require_relative '../Item/food.rb'

class Plant < Event

  def initialize
    super
    @command = "pick"
  end

  def run(entity)
    if (@number > 0)
      puts "You pick a #{@fruit.name}."
      entity.add_item(@fruit, 1)
      @number -= 1
    else
      puts "There are no fruits left here!"
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
    @dictionary = RussianDictionary.new
  end

  def run(entity)
    if (@number > 0)
      puts "You pick a #{@fruit.name}."
      entity.add_item(@fruit, 1)
      @number -= 1
    elsif (@number == -1)
      #functions in "story"
      puts "As you greedily stare up into the tree"
      puts "You hear a loud crack, and a massive book"
      puts "crashes down on your head"
      puts "When you regain your wits, you read the cover"
      puts "'Russian to English Dictionary'"
      puts "It's not likely you'll need something like that,"
      puts "But hey, you might find some use for it at some point"
      entity.add_item(@dictionary, 1)
    elsif (@number == 0 || @number < -1)
      @number -= 1
      puts "There are no fruits left here!"
    end
  end

end
