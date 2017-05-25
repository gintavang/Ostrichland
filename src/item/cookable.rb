require_relative 'food.rb'

class Cookable < Item

  def initialize(name: "Cookable", price: 0, cooked_variant: Item.new)
    super(name: name, price: price)
    @cooked_variant = cooked_variant
  end

  def use(entity)
    puts "This should be cooked before eaten!"
  end

  # The Item that results from cooking this.
  attr_reader :cooked_variant
end

class RawBluegill < Cookable
  def initialize
    super(name: "Raw Bluegill", price: 10, cooked_variant: Bluegill.new)
  end
end
