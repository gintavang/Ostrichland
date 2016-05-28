require_relative 'map.rb'
require_relative "../src/util.rb"

# %%%%%-----ENTITY SECTION-----%%%%% #

# ~~~$$$~~~Abstract classes~~~$$$~~~#

class Entity

  # Constructors need to be changed,
  # but they are enough for now.
  def initialize(name)
    @name = name
    @max_hp = 5
    @hp = 3
  end

  def initialize(name, max_hp, hp)
    @name = name
    @max_hp = max_hp
    @hp = hp
  end

  # Automatically creates getter and setter methods.
  attr_accessor :name
  attr_accessor :max_hp
  attr_accessor :hp

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

  # Needs to check id in a different way.
  # Perhaps the hash of a string?
  def self.create(id)
    case id
    when "Banana"
      Banana.new
    else
      Banana.new
    end
  end

  def use
    raise "Cannot use abstract item!"
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

# ~~~$$$~~~Foods~~~$$$~~~#

class Banana < Food
  def initialize
    @recovers = 2
  end
end
