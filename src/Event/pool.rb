require_relative 'event.rb'
require_relative '../Item/bait.rb'

# Todo: May need to construct derivations of Pool.
# Because you cannot pass a list of baits (duh).
class Pool < Event

  def initialize
    super
    @command = "fish"
  end

  def run(entity)
    index = entity.has_item_by_string("Fishing Pole")
    if (index != -1)
      entity_baits = find_bait(entity)
      if (!entity_baits.empty?)
        puts "Available bait: "
        entity_baits.each do |bait|
          puts "#{bait.first.name} (#{bait.second})"
        end

        print "Which bait will you use?: "
        input = gets.chomp
        index = entity.has_item_by_string(input)

        if (index != -1)
          item = entity.inventory[index].first
          # The Entity must select Bait.
          if (item.is_a? Bait)
            # The Entity won't catch fish unless the
            # appropriate Bait for this Pool is used.
            if (@baits.any? { |bait| bait == item } )
              float = rand
              if (float > 0.5)
                puts "Wow! You caught a #{item.catches.name}!"
                entity.add_item(item.catches, 1)
              else
                puts "Nothing takes the bait!"
              end
            else
              puts "Nothing takes the bait!"
            end
            entity.remove_item(item, 1)
          else
            puts "That can't be used as bait!!"
          end
        else
          puts "You don't have #{input}!"
        end

      else
        puts "Are you mad? Where's your bait?"
      end
    else
      puts "You don't have a Fishing Pole! Tsk tsk..."
    end
  end

  # Returns a list of Bait in the Entity's inventory.
  def find_bait(entity)
    entity_baits = []
    entity.inventory.each do |couple|
      if (couple.first.is_a? Bait)
        entity_baits.push(couple)
      end
    end
    return entity_baits
  end

  attr_accessor :baits
end

class BluegillPool < Pool
  def initialize
    super
    @baits = [Worm.new]
  end
end
