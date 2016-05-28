class Shop

  def self.create(id)
    case id
    when :zdras_shop
      ZdrasShop.new
    else
      ZdrasShop.new
    end
  end

  def has_item(name)
    @items.each do |item|
      if (item.name == name)
        return true
      end
    end
  end

  def print_items
    @items.each do |item|
      puts item.name + " : " + item.price.to_s + " gold"
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

        if (name == "none")
          puts "test"
        # This check prevents creating a fake item.
        elsif (has_item(name))
          item = Item.create(name)
          print "How many do you want?: "
          amount_to_buy = gets.chomp
          total_cost = amount_to_buy.to_i * item.price

          # The entity does not have enough gold.
          if (total_cost > entity.gold)
            puts "You don't have enough gold!"
          # Otherwise, add the item(s) and subtract the gold.
          else
            entity.gold -= total_cost
            entity.add_item(name, amount_to_buy)
          end
        else
          puts "I don't have #{name}!"
        end
      elsif (input == "sell")
        puts "Your inventory:"
        entity.print_inventory

        print "What would you like to sell? (or none): "
        input = gets.chomp
        inventory_count = entity.count_item(input)

        if (input == "none")
          puts "test"
        # This check ensures that the Entity has such an item.
        elsif (inventory_count > 0)
          item = Item.create(input)
          puts "I'll buy that for " + (item.price / 2).to_s
          print "How many do you want to sell?: "
          amount_to_sell = gets.chomp

          if (amount_to_sell > inventory_count)
            puts "You don't have that many to sell!"
          else
            entity.gold += (item.price / 2) * amount_to_sell
            entity.remove_item(name, amount_to_sell)
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
