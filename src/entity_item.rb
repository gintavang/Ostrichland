require_relative "util.rb"
require_relative 'map.rb'

# %%%%%-----ENTITY SECTION-----%%%%% #

# ~~~$$$~~~Abstract classes~~~$$$~~~#

class Entity

  # Change constructor...
  def initialize(name, max_hp = 5, hp = 3)
    @name = name
    @max_hp = max_hp
    @hp = hp
    @inventory = []
    @gold = 0
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
  end

  # Automatically creates getter and setter methods.
  attr_accessor :name
  attr_accessor :max_hp, :hp

  # The inventory is stored as an array
  # of Couple objects. The first data type
  # is the item's name. The second data type
  # is its count in the inventory.
  attr_accessor :inventory, :gold

end

class Player < Entity

  def initialize(name)
    @name = name
    @max_hp = 100
    @hp = 100
    @map = Map.create(:zdrasvootyay)
    @location = Couple.new(1,5)
  end

  attr_accessor :map, :location

  def move(direction)
    case direction
    when "w"
      if @map.tiles[@location.first][@location.second - 1].passable
        @location.second -= 1
      else
        puts "You can't go that way!"
        #print possible directions
      end
    when "e"
      if @map.tiles[@location.first][@location.second + 1].passable
        @location.second += 1
      else
        puts "You can't go that way!"
        #print possible directions
      end
    when "n"
      if @map.tiles[@location.first - 1][@location.second].passable
        @location.first -= 1
      else
        puts "You can't go that way!"
        #print possible directions
      end
    when "s"
      if @map.tiles[@location.first + 1][@location.second].passable
        @location.first += 1
      else
        puts "You can't go that way!"
        #print possible directions
      end
    else
      puts "That ain't no D-recshun"
    end
  end

end

# %%%%%-----ITEM SECTION-----%%%%% #

# ~~~$$$~~~Abstract classes~~~$$$~~~#

class Item

  def use(entity)
    puts "Nothing happens."
  end

  # Equality operator.
  def ==(rhs)
    return (@name == rhs.name)
  end

  attr_accessor :name, :price

end

class Bait < Item
  def use(entity)
    puts "This should be used at a fishing spot."
  end
end

class Food < Item

  # The amount of hp that the food recovers.
  attr_reader :recovers

  def use(entity)
    entity.hp += @recovers

    # Prevents hp > max_hp.
    if (entity.hp > entity.max_hp)
      entity.hp = entity.max_hp
    end
  end

end

# ~~~$$$~~~Baits~~~$$$~~~#

class Chub < Bait
  # Used for Raw Weakfish.
  def initialize
    @name = "Chub"
    @price = 3
  end
end

# ~~~$$$~~~Foods~~~$$$~~~#

class Banana < Food
  def initialize
    @name = "Banana"
    @price = 2
    @recovers = 2
  end
end

# ~~~$$$~~~Items~~~$$$~~~#

class Bucket < Item
  def initialize
    @name = "Bucket"
    @price = 2
  end
end

class FishingPole < Item
  def initialize
    @name = "Fishing Pole"
    @price = 15
  end
end

class Fuel < Item
  # Override use on boat's Tile?
  def initialize
    @name = "Fuel"
    @price = 30
  end
end
