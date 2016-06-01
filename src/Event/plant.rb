require_relative 'event.rb'
require_relative '../Item/food.rb'

class Plant < Event

  def initialize
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
