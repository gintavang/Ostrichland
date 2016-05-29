require_relative 'event.rb'

class Shop < Event

  def initialize
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
  end

  def run(entity)
    puts "Welcome to " + @name
    print "Would you like to buy, sell, or exit?: "
    input = gets.chomp

    while (input != "exit")
      if (input == "buy")
        puts "Please take a look at my wares."
        print_items
        print "What would you like (or none): "

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
            puts "You don't have enough gold!"
          # Otherwise, add the item(s) and subtract the gold.
          else
            # Checks that the Entity wants to buy at least 1.
            if (amount_to_buy.to_i < 1)
              puts "Is this some kind of joke?"
              puts "You need to request a positive amount!"
            else
              entity.gold -= total_cost
              entity.add_item(item, amount_to_buy.to_i)
            end
          end
        else
          puts "I don't have #{name}!"
        end
      elsif (input == "sell")
        puts "Your inventory:"
        entity.print_inventory

        print "What would you like to sell? (or none): "
        name = gets.chomp
        index = entity.has_item_by_string(name)

        if (name == "none")
        # This check ensures that the Entity has such an item.
        elsif ((index > -1) && (item_count = entity.inventory[index].second) > 0)
          item = entity.inventory[index].first
          puts "I'll buy that for " + (item.price / 2).to_s
          print "How many do you want to sell?: "
          amount_to_sell = gets.chomp

          if (amount_to_sell.to_i > item_count)
            puts "You don't have that many to sell!"
          else
            # Checks that the Entity wants to buy at least 1.
            if (amount_to_sell.to_i < 1)
              puts "Is this some kind of joke?"
              puts "You need to sell a positive amount!"
            else
              entity.gold += (item.price / 2) * amount_to_sell.to_i
              entity.remove_item(item, amount_to_sell.to_i)
            end
          end

        else
          puts "You can't sell what you don't have."
        end
      end

      print "Would you like to buy, sell, or exit?: "
      input = gets.chomp
    end
  end

  attr_accessor :name, :items

end

class ZdrasShop < Shop
  def initialize
    @name = "The Zdras Shop"
    @items = [Bucket.new, Chub.new, FishingPole.new, Fuel.new]
  end
end
