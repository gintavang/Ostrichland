require_relative "attack.rb"

#WEAPON ATTACK WILL ALWAYS BE LAST ATTACK IN ENTITY ATTACK ARRAY

#Slingshot
class FlingRock < Attack
	def initialize
		super
		@name = "Fling Rock"
		@damage = 15
		@success_rate = 75
		@wpn_attack = true
	end
end

#Stick
class Wack < Attack
	def initialize
		super
		@name = "Wack"
		@damage = 8
		@success_rate = 99
		@wpn_attack = true
	end
end

