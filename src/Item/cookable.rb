require_relative 'food.rb'
require_relative 'item.rb'

class Cookable < Item

  def use(entity)
    puts "This should be cooked before eaten!"
  end

  # The Item that results from cooking this.
  attr_reader :cooked_variant
end

class RawBluegill < Cookable
  def initialize
    @name = "Raw Bluegill"
    @price = 10
    @cooked_variant = Bluegill.new
  end
end
