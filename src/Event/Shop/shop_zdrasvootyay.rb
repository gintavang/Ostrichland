require_relative 'shop.rb'
require_relative '../../Item/bait.rb'
require_relative '../../Item/item.rb'

# Location: [3,3]
class ZdrasShop < Shop
  def initialize
    super
    @name = "The Zdras Shop"
    @items = [Bucket.new, Chub.new, FishingPole.new, Fuel.new]
  end
end
