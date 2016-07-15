require_relative "entity.rb"

class Monster < Entity
	
	def choose_attack
		if attacks.size == 1
			return attacks[0]
		end
	  return attacks[Random.rand(attacks.size)]
	end

	# TODO
	# function to assemble new inventory
	# from an array of preset items
	# each time a monster is regenerated

	
	attr_accessor :visible, :regen, :message, :max_gold
end

class HeadlessOstrich < Monster
	def initialize 
		@name = "Headless Ostrich"
		@max_hp = 5
		@hp = 5
		@visible = true
		@regen = true
		@defense = 2
		@attack = 10
		@message = "BLAAAARGGG\n"
		@attacks = [PitifulGroan.new]
		@gold = Random.rand(3)
		@max_gold = 3
		#@inventory = [Pillow.new]
	end
end

class RabidCockerSpaniel < Monster
	def initialize
		@name = "Rabid Cocker Spaniel"
		@max_hp = 8
		@hp = 8
		@visible = true
		@regen = true
		@defense = 3
		@attack = 13
		@message = "GRRRRRRRRR\n"
		@attacks = [FrothyBite.new, Uppercut.new]
		@gold = Random.rand(5)
		@max_gold = 5
		#@inventory = [Pillow.new, Stick.new]
	end
end