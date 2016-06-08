require_relative '../event.rb'

class Shop < Event

  def initialize
    super
    @command = "shop"
  end

  # Returns the index of the item, if it exists.
  # Otherwise, returns -1.
  def has_item(name)
    @items.each_with_index do |item, index|
      if (item.name == name)
        return index
      end
    end
    return -1
  end

  # Displays a formatted list of the Shop's items.
  def print_items
    @items.each do |item|
      puts item.name + " (#{item.price} gold)"
    end
    print "\n"
  end

  def run(entity)
    puts "Welcome to #{@name}."
    puts "Current gold in your pouch: #{entity.gold}."
    print "Would you like to buy, sell, or exit?: "
    input = gets.chomp

    while (input != "exit")
      if (input == "buy")
        print "\nPlease take a look at my wares.\n\n"
        print_items
        print "What would you like (or none)?: "

        name = gets.chomp
        index = has_item(name)

        if (name == "none")
        # This check prevents creating a fake item.
        elsif (index != -1)
          item = @items[index]
          print "How many do you want?: "
          amount_to_buy = gets.chomp
          total_cost = amount_to_buy.to_i * item.price

          # The entity does not have enough gold.
          if (total_cost > entity.gold)
            puts "\nYou don't have enough gold!"
            print "You only have #{entity.gold}, but you need #{total_cost}!\n\n"
          # Otherwise, add the item(s) and subtract the gold.
          else
            # Checks that the Entity wants to buy at least 1.
            if (amount_to_buy.to_i < 1)
              puts "\nIs this some kind of joke?"
              print "You need to request a positive amount!\n\n"
            else
              entity.gold -= total_cost
              entity.add_item(item, amount_to_buy.to_i)
              print "\nThank you for your patronage!\n\n"
            end
          end
        else
          print "\nI don't have #{name}!\n\n"
        end
      elsif (input == "sell")
        if (!entity.inventory.empty?)
          puts "\nYour inventory:"
          entity.print_inventory

          print "\nWhat would you like to sell? (or none): "
          name = gets.chomp
          index = entity.has_item_by_string(name)

          if (name == "none")
          # This check ensures that the Entity has such an item.
          elsif ((index > -1) && (item_count = entity.inventory[index].second) > 0)
            item = entity.inventory[index].first
            puts "I'll buy that for #{item.price / 2} gold."
            print "How many do you want to sell?: "
            amount_to_sell = gets.chomp

            if (amount_to_sell.to_i > item_count)
              print "\nYou don't have that many to sell!\n\n"
            else
              # Checks that the Entity wants to buy at least 1.
              if (amount_to_sell.to_i < 1)
                puts "\nIs this some kind of joke?"
                print "You need to sell a positive amount!\n\n"
              else
                entity.gold += (item.price / 2) * amount_to_sell.to_i
                entity.remove_item(item, amount_to_sell.to_i)
                print "\nThank you for your patronage!\n\n"
              end
            end

          else
            print "\nYou can't sell what you don't have.\n\n"
          end
        else
          print "\nYou have nothing to sell!!\n\n"
        end
      else
        print "\n"
      end

      puts "Current gold in your pouch: #{entity.gold}."
      print "Would you like to buy, sell, or exit?: "
      input = gets.chomp
    end
  end

  attr_accessor :name, :items

end
