require_relative "../Entity/entity.rb"
require_relative "../Entity/player.rb"
require_relative "../Entity/monster.rb"

class Attack
  def intitialize
    @wpn_attack = false;
  end
	attr_accessor :name, :damage, :success_rate, :wpn_attack

end

class Kick < Attack
	def initialize
		@name = "Kick"
		@damage = 2
		@success_rate = 99
	end
end

class PitifulGroan < Attack
	def initialize
		@name = "Pitiful Groan"
		@message = "EEEUHHHHHGHHGHEH"
		@damage = 2
		@success_rate = 75
	end
end

class FrothyBite < Attack
  def initialize
    @name = "Frothy Bite"
    @message = "CHOMP!"
    @damage = 5
    @success_rate = 25
  end
end

class Uppercut < Attack
  def initialize
    @name = "Uppercut"
    @message = "SWOOSH!"
    @damage = 5
    @success_rate = 80
  end
end

def battle(player, monster)
  puts monster.message
  type("\nYou've run into a vicious #{monster.name}!\n\n")
  while player.hp > 0
    puts "Choose an attack:"
    player.print_attacks
    print "> "
    input = gets.chomp
    puts "\n"

    if (input.casecmp("Run") == 0)
      if (attempt_run(monster))
        type("You successfully escaped the clutches of the #{monster.name}!\n\n")
        break
      else
        type("You're cornered!\n\n")
      end
    else
      index = player.has_attack_by_string(input)
      #input error loop
      while (index == -1 && input.casecmp("Run") != 0)
        puts "You don't have the attack '#{input}'"
        puts "Try one of these:"
        player.print_attacks
        print "> "
        input = gets.chomp
        index = player.has_attack_by_string(input)
      end
      #player move
      if (input.casecmp("Run") != 0)
        player.attempt_attack(@attacks[index], monster)
      end
    end

    if (monster.hp > 0)
      monster.attempt_attack(monster.choose_attack, player)
    else
    	type("You defeated the #{monster.name}\n")
      if (monster.gold > 0)
        type("and they dropped #{monster.gold} gold!\n")
        player.gold += monster.gold
      end
      puts "\n"
      if monster.regen
        monster.hp = monster.max_hp
        monster.gold = Random.rand(monster.max_gold)
      end
      break
    end
  end
  #remove equip attacks
  if (player.hp == 0)
    sleep(2)
    player_died
  end
end
