require_relative 'shop.rb'
require_relative '../../Item/bait.rb'
require_relative '../../Item/item.rb'

# Location: [3,3]
class ZdrasShop < Shop
  def initialize
    super # Calls the parent's method of the same name.
    @name = "The Zdras Shop"
    @items = [Bucket.new, Chub.new, FishingPole.new, Fuel.new]
  end
end
