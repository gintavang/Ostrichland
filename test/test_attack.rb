require "test/unit"
require_relative "../src/Attack/attack.rb"
require_relative "../src/Entity/entity.rb"
require_relative "../src/Entity/player.rb"

#class TestAttack < Test::Unit::TestCase

def simple_attack_on_entity
	player = Player.new("player1")
	entity = Entity.new("monster")
	attack = Kick.new
	hit = player.attempt_attack(attack, entity)
end

def simple_attack_on_player
	player = Player.new("player1")
	entity = Entity.new("monster")
	attack = PitifulGroan.new
	hit = entity.attempt_attack(attack, player)
end
#end
simple_attack_on_entity
simple_attack_on_player

