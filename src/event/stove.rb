require_relative '../item/cookable.rb'

class Stove < Event

  def initialize
    super(command: "cook")
  end

  def run(entity)
    entity_cookables = find_cookable(entity)

    # Ensures the Entity has something to cook.
    unless entity_cookables.empty?
      puts "Available to cook: "
      entity_cookables.each do |cookable|
        puts "#{cookable.first.name} (#{cookable.second})"
      end

      print "\nWhat would you like to cook?: "
      input = player_input
      index = entity.has_item(input)

      # Ensures the Entity has such an Item.
      if index
        item = entity.inventory[index]

        # Ensures the Item is possible to cook.
        if (item.first.is_a? Cookable)
          print "How many would you like to cook?: "
          input = player_input

          # Ensures that the input is a number which the Entity possesses.
          if (input.to_i.positive? && input.to_i <= item.second)
            total_cooked = 0
            total_burnt = 0

            # Determines the numbers of cooked and burnt food.
            for i in 0..(input.to_i - 1)
              [true, false].sample ? total_cooked += 1 : total_burnt += 1
            end

            print_results(item.first.cooked_variant.name, total_cooked, total_burnt)
            print "\n"

            # Update the Entity's inventory.
            entity.remove_item(item.first, input.to_i)
            entity.add_item(item.first.cooked_variant, total_cooked) if total_cooked.positive?
            entity.add_item(BurntFlub.new, total_burnt) if total_burnt.positive?
          else
            print "\nThat's not acceptable input!\n\n"
          end
        else
          print "\nIt's not a good idea to cook that!!\n\n"
        end
      else
        print "\nYou don't have #{input}!\n\n"
      end
    else
      print "There's nothing to cook in your pouch!\n\n"
    end
  end

  # Returns a list of Cookable items in the Entity's inventory.
  def find_cookable(entity)
    entity_cookables = []
    entity.inventory.each do |couple|
      if (couple.first.is_a? Cookable)
        entity_cookables.push(couple)
      end
    end
    return entity_cookables
  end

  def print_results(name, total_cooked, total_burnt)
    puts "Results of cooking: "
    puts "Success: #{total_cooked} #{name}"
    puts "Failure: #{total_burnt} Burnt Flub"
  end

end
