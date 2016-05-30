require_relative 'item.rb'

class Bait < Item
  def use(entity)
    puts "This should be used at a fishing spot."
  end
end

class Chub < Bait
  # Used for Raw Weakfish.
  def initialize
    @name = "Chub"
    @price = 3
  end
end
