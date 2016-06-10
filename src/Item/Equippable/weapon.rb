require_relative '../item.rb'

class Weapon < Item

  # Todo: Abstract this method into the Equippable class.
  # Perhaps the first & second statements are the only parts that need to be overriden?
  # Then we can call super?
  def equip(entity)
    # Store the Entity's previous Weapon.
    prev_weapon = entity.weapon

    # Update the Entity variables.
    # Todo: Data structure holds all possible status changes.
    entity.weapon = self
    entity.attack += self.power

    # Updates if the Entity had a previous Weapon equipped.
    if (!prev_weapon.nil?)
      entity.attack -= prev_weapon.power
      entity.add_item(prev_weapon, 1)
    end

    # Removes the new Weapon from the Entity's inventory.
    entity.remove_item(self, 1)
  end

  def unequip(entity)
    entity.weapon = nil
    entity.attack -= self.power
    entity.add_item(self, 1)
  end

  def use(entity)
    equip(entity)
  end

  attr_accessor :power
end

class Slingshot < Weapon
  def initialize
    @name = "Slingshot"
    @price = 40
    @power = 8
  end
end

class Stick < Weapon
  def initialize
    @name = "Stick"
    @price = 10
    @power = 3
  end
end
