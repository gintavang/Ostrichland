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

        print "\nWhich bait will you use?: "
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
                print "\nWow! You caught a #{item.catches.name}!\n\n"
                entity.add_item(item.catches, 1)
              else
                print "\nNothing takes the bait!\n\n"
              end
            else
              print "\nNothing takes the bait!\n\n"
            end
            entity.remove_item(item, 1)
          else
            print "\nThat can't be used as bait!!\n\n"
          end
        else
          print "\nYou don't have #{input}!\n\n"
        end

      else
        print "Are you mad? Where's your bait?\n\n"
      end
    else
      print "You don't have a Fishing Pole! Tsk tsk...\n\n"
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
