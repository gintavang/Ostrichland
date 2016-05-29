require "test/unit"
require_relative "../src/entity_item.rb"

class TestEntityMovement < Test::Unit::TestCase

	def test_basic_movement
		player = Player.new("player1")
		player.map.print_map

		#starting tile
		assert_equal(1, player.location.first)
		assert_equal(5, player.location.second)

		player.move("w")
		assert_equal(1, player.location.first)
		assert_equal(4, player.location.second)

		player.move("s")
		assert_equal(2, player.location.first)
		assert_equal(4, player.location.second)

		player.move("w")

		assert_equal(2, player.location.first)
		assert_equal(3, player.location.second)

		player.move("n")
		assert_equal(1, player.location.first)
		assert_equal(3, player.location.second)

		player.move("e")
		assert_equal(1, player.location.first)
		assert_equal(4, player.location.second)
	end

  def test_border_impassable
    player = Player.new("player1")

    #starting tile
		assert_equal(1, player.location.first)
		assert_equal(5, player.location.second)

		#try to cross border of map from south
		player.move("n")
		assert_equal(1, player.location.first)
		assert_equal(5, player.location.second)

		player.move("w"); player.move("w")

		#try to pass through impassable from east
		player.move("w")
		assert_equal(1, player.location.first)
		assert_equal(3, player.location.second)

		player.move("s"); player.move("s");

		#try to move through impassable from north
		player.move("s")
		assert_equal(3, player.location.first)
		assert_equal(3, player.location.second)

		player.move("e"); player.move("e"); 

		#try to move through impassable from west
		player.move("e")
		assert_equal(3, player.location.first)
		assert_equal(5, player.location.second)
  end

  #test partial reveal
  def test_player_map_partial
  	player = Player.new("player1")

  	player.print_player_map

  									###
		#map->					••#
		#								••# 
  	

  	player.move("w"); player.move("s"); player.move("w")

			 			 		 ####
								#•••#
		#map->			••••#
			      		#•••

  	player.print_player_map
  	
  end

  #test full reveal of map
  def test_player_map_full
  	player = Player.new("player1")

  	player.print_player_map

  	player.move("s"); player.move("s"); player.move("w");
  	player.move("n"); player.move("n"); player.move("w");
  	player.move("s"); player.move("s"); player.move("n");
  	player.move("w"); player.move("w"); player.move("n");
  	player.move("s"); player.move("s"); player.move("s");
  	player.move("e"); player.move("s"); player.move("e");
  	player.move("e"); player.move("s"); player.move("s");
  	player.move("e");

  	player.print_player_map

  end

end
