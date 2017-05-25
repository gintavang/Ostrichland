require_relative 'cookable.rb'

class Bait < Item

  def initialize(name: "Bait", price: 0, catches: Item.new)
    super(name: name, price: price)
    @catches = catches
  end

  def use(entity)
    puts "This should be used at a fishing spot."
  end

  # The Item that this Bait will catch.
  attr_reader :catches
end

# "Level 1" Bait
# Catches Raw Bluegill.
class Worm < Bait
  def initialize
    super(name: "Worm", price: 3, catches: RawBluegill.new)
  end
end
