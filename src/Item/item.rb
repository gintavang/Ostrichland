class Item

  def use(entity)
    puts "Nothing happens."
  end

  # Equality operator.
  def ==(rhs)
    return (@name == rhs.name)
  end

  attr_accessor :name, :price

end

class Bucket < Item
  def initialize
    @name = "Bucket"
    @price = 2
  end
end

class FishingPole < Item
  def initialize
    @name = "Fishing Pole"
    @price = 15
  end
end

class Fuel < Item
  # Override use on boat's Tile?
  def initialize
    @name = "Fuel"
    @price = 30
  end
end

class RussianDictionary < Item
  def initialize
    @name = "Russian-English Dictionary"
    @price = 0
  end
end