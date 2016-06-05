require_relative 'item.rb'

class Food < Item

  # The amount of hp that the food recovers.
  attr_reader :recovers

  def use(entity)
    entity.hp += @recovers

    # Prevents hp > max_hp.
    if (entity.hp > entity.max_hp)
      entity.hp = entity.max_hp
    end

  # Removes the item from the Entity's inventory.
  # Must be specified whenever the item is consumable.
  entity.remove_item(self, 1)
  end

end

class Banana < Food
  def initialize
    @name = "Banana"
    @price = 2
    @recovers = 2
  end
end
