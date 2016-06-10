require_relative '../util.rb'

class Entity

  # Change constructor...
  def initialize(name, max_hp = 5, hp = 3,
    inventory = [], gold = 0)
    @name = name

    @max_hp = max_hp
    @hp = hp
    @attack = 3
    @defense = 2

    # Monsters can also use items in battle.
    @inventory = inventory

    # Monsters might drop a percentage of this value.
    @gold = gold

    @weapon = nil
    @helmet = nil
  end

  # Adds the item and the given amount to the inventory.
  def add_item(item, amount)
    # Check if the Entity already has that item
    # in the inventory. If so, just increase
    # the amount.
    @inventory.each do |couple|
      if (couple.first == item)
        couple.second += amount
        return
      end
    end
    # If not already in the inventory, push a Couple.
    @inventory.push(Couple.new(item, amount))
  end

  # Requires an Item as the argument.
  # Returns the index of that item, if it exists.
  # Otherwise, returns -1.
  def has_item_by_object(item)
    inventory.each_with_index do |couple, index|
      if (couple.first == item)
        return index
      end
    end
    return -1
  end

  # Requires a String as the argument.
  # Returns the index of that item, if it exists.
  # Otherwise, returns -1.
  def has_item_by_string(name)
    inventory.each_with_index do |couple, index|
      if (couple.first.name == name)
        return index
      end
    end
    return -1
  end

  # Removes the item and, at most, the given amount
  # from the inventory
  def remove_item(item, amount)
    # Check if the Entity already has that item
    # in the inventory. If so, just decrease
    # the amount.
    @inventory.each_with_index do |couple, index|
      if (couple.first == item)
        couple.second -= amount
        if (couple.second <= 0)
          @inventory.delete_at(index)
        end
        return
      end
    end
  end

  # Prints the inventory in a nice format.
  def print_inventory
    @inventory.each do |couple|
      puts couple.first.name + " (#{couple.second})"
    end
    print "\n"
  end

  # Prints the status in a nice format.
  def print_status
    puts "HP: #{hp}/#{max_hp}"
    puts "Attack: #{attack}"
    puts "Defense: #{defense}"
    print "\n"

    print "Weapon: "
    if (!@weapon.nil?)
      puts "#{weapon.name}"
    else
      puts "none"
    end

    print "Helmet: "
    if (!@helmet.nil?)
      puts "#{helmet.name}"
    else
      puts "none"
    end

    print "\n"
  end

  # If the item exists in the Entity's inventory,
  # then it uses the item on Entity e.
  def use_item_by_string(name, e)
    index = has_item_by_string(name)
    if (index != -1)
      inventory[index].first.use(e)
    else
      print "What?! You don't have #{name}!\n\n"
    end
  end

  def unequip_item_by_string(name)
    if ((!@weapon.nil?) && name == @weapon.name)
      @weapon.unequip(self)
    elsif ((!@helmet.nil?) && name == @helmet.name)
      @helmet.unequip(self)
    else
      print "You are not equipping #{name}!\n\n"
    end
  end

  # Automatically creates getter and setter methods.
  attr_accessor :name
  attr_accessor :max_hp, :hp
  attr_accessor :attack
  attr_accessor :defense

  # The inventory is stored as an array
  # of Couple objects. The first data type
  # is the item's name. The second data type
  # is its count in the inventory.
  attr_accessor :inventory, :gold

  # Maybe a dictionary/hash table would make unequip easier.
  attr_accessor :weapon
  attr_accessor :helmet

end
