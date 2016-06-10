require_relative 'item.rb'

class Food < Item

  def use(entity)
    entity.hp += @recovers

    # Prevents hp > max_hp.
    if (entity.hp > entity.max_hp)
      entity.hp = entity.max_hp
    end

  # Removes the item from the Entity's inventory.
  # Must be specified whenever the item is consumable.
  # Todo: Doesn't actually work. If you use it on a monster,
  # it tries to take it away from the monster's inventory.
  # MAYBE: use returns a Boolean value, which says whether
  # the item was consumed or not.
  entity.remove_item(self, 1)
  end

  # The amount of hp that the food recovers.
  attr_reader :recovers

end

class Banana < Food
  def initialize
    @name = "Banana"
    @price = 2
    @recovers = 2
  end
end

class Bluegill < Food
  def initialize
    @name = "Bluegill"
    @price = 12
    @recovers = 6
  end
end
