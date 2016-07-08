require_relative "../Entity/entity.rb"
require_relative "../Entity/player.rb"
require_relative "../Entity/monster.rb"

class Attack

	attr_accessor :name, :damage, :success_rate

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

def print_attacks(player)
  count = 0
  player.attacks.each do |i|
    if (count > 1)
      print "\n"
    end
    print "❊ " + i.name + "  "
    count += 1
  end
  print "\n\n"
end

def battle(player, monster)
  puts monster.message
  type("\nYou've run into a vicious #{monster.name}!\n\n")
  while player.hp > 0
    #sleep 2
    puts "Choose an attack:"
    print_attacks(player)
    print "> "
    input = gets.chomp
    puts "\n"
    index = player.has_attack_by_string(input)
    #input error loop
    while (index == -1)
      puts "You don't have the attack '#{input}'"
      puts "Try one of these:"
      player.print_attacks_simple
      print "> "
      input = gets.chomp
      index = player.has_attack_by_string(input)
    end
    #player move
    player.attempt_attack(@attacks[index], monster)
    if (monster.hp > 0)
      monster.attempt_attack(monster.choose_attack, player)
    else
    	puts "You defeated the #{monster.name}"
      if (monster.gold > 0)
        puts "and they dropped #{monster.gold} gold!"
        player.gold += monster.gold
      end
      if monster.regen
        monster.hp = monster.max_hp
        monster.gold = Random.rand(3)
      end
      break
    end
  end
  if (player.hp == 0)
    sleep(2)
    player_died
  end
end

