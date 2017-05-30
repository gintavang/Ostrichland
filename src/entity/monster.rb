require_relative '../item/equippable/helmet.rb'
require_relative '../item/equippable/weapon.rb'

class HeadlessOstrich < Monster
	def initialize
    super(name: "Headless Ostrich", max_hp: 5, hp: 5, attack: 10, defense: 2,
          message: "BLAAAARGGG\n", battle_commands: [PitifulGroan.new],
          gold: 3, treasures: [Couple.new(Pillow.new, 1), Couple.new(nil, 5)])
	end
end

class RabidCockerSpaniel < Monster
	def initialize
    super(name: "Rabid Cocker Spaniel", max_hp: 8, hp: 8, attack: 13, defense: 3,
          message: "GRRRRRRRRR\n", battle_commands: [FrothyBite.new, Uppercut.new],
          gold: 5, treasures: [Couple.new(Pillow.new, 2),
                               Couple.new(Stick.new, 2),
                               Couple.new(nil, 2)])
	end
end