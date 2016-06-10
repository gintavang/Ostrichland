require_relative '../item.rb'

class Helmet < Item

  # Todo: Abstract this method into the Equippable class.
  # Perhaps the first & second statements are the only parts that need to be overriden?
  # Then we can call super?
  def equip(entity)
    # Store the Entity's previous Helmet.
    prev_helmet = entity.helmet

    # Update the Entity variables.
    # Todo: Data structure holds all possible status changes.
    entity.helmet = self
    entity.defense += self.protect

    # Updates if the Entity had a previous Helmet equipped.
    if (!prev_helmet.nil?)
      entity.defense -= prev_helmet.protect
      entity.add_item(prev_helmet, 1)
    end

    # Removes the new Helmet from the Entity's inventory.
    entity.remove_item(self, 1)
  end

  def unequip(entity)
    entity.helmet = nil
    entity.defense -= self.protect
    entity.add_item(self, 1)
  end

  def use(entity)
    equip(entity)
  end

  attr_accessor :protect
end

class Pillow < Helmet
  def initialize
    @name = "Pillow"
    @price = 15
    @protect = 2
  end
end

class TinCan < Helmet
  def initialize
    @name = "Tin Can"
    @price = 55
    @protect = 4
  end
end
