require_relative 'shop.rb'

# Location: [3,3]
class ZdrasShop < Shop
  def initialize
    @name = "The Zdras Shop"
    @items = [Bucket.new, Chub.new, FishingPole.new, Fuel.new]
  end
end
