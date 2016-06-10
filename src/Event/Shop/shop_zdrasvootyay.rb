require_relative 'shop.rb'
require_relative '../../Item/bait.rb'
require_relative '../../Item/item.rb'
require_relative '../../Item/Equippable/helmet.rb'
require_relative '../../Item/Equippable/weapon.rb'

# Location: [1,3]
class TheTools < Shop
  def initialize
    super
    @name = "The Tools"
    @items = [Stick.new, Pillow.new, Slingshot.new, TinCan.new]
  end
end

# Location: [3,3]
class ZdrasShop < Shop
  def initialize
    super
    @name = "The Zdras Shop"
    @items = [Bucket.new, Worm.new, FishingPole.new, Fuel.new]
  end
end
