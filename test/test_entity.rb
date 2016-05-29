require "test/unit"
require_relative "../src/entity_item.rb"

class TestAddItem < Test::Unit::TestCase

  def test_add_trivial
    entity = Entity.new("")
    entity.add_item(Banana.new, 1)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)
  end

  def test_add_complex
    entity = Entity.new("")

    entity.add_item(Banana.new, 3)
    entity.add_item(Bucket.new, 4)
    entity.add_item(Banana.new, 2)
    entity.add_item(FishingPole.new, 1)
    entity.add_item(Bucket.new, 3)
    entity.add_item(Banana.new, 1)
    entity.add_item(FishingPole.new, 2)

    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(6, count)
    count = entity.inventory[entity.has_item_by_string("Bucket")].second
    assert_equal(7, count)
    count = entity.inventory[entity.has_item_by_string("FishingPole")].second
    assert_equal(3, count)

    # The Entity should have 3 objects in the inventory.
    assert_equal(3, entity.inventory.length)
  end
end

class TestHasItemByObject < Test::Unit::TestCase

  def test_no_items
    entity = Entity.new("")
    assert_equal(-1, entity.has_item_by_object(Banana.new))
  end

  def test_count_one
    entity = Entity.new("")
    entity.inventory.push(Couple.new(Banana.new, 1))
    count = entity.inventory[entity.has_item_by_object(Banana.new)].second
    assert_equal(1, count)
  end
end

class TestHasItemByString < Test::Unit::TestCase

  def test_no_items
    entity = Entity.new("")
    assert_equal(-1, entity.has_item_by_string("Banana"))
  end

  def test_count_one
    entity = Entity.new("")
    entity.inventory.push(Couple.new(Banana.new, 1))
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)
  end

end

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

class TestRemoveItem < Test::Unit::TestCase

  def test_remove_trivial
    entity = Entity.new("")

    entity.add_item(Banana.new, 1)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)

    entity.remove_item(Banana.new, 1)
    assert_equal(-1, entity.has_item_by_string("Banana"))
    assert_equal(0, entity.inventory.length)
  end

  def test_remove_some
    entity = Entity.new("")

    entity.add_item(Banana.new, 3)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(3, count)

    entity.remove_item(Banana.new, 2)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)
    assert_equal(1, entity.inventory.length)

    entity.remove_item(Banana.new, 1)
    assert_equal(-1, entity.has_item_by_string("Banana"))
    assert_equal(0, entity.inventory.length)
  end

  def test_remove_over
    entity = Entity.new("")
    entity.add_item(Banana.new, 3)
    entity.remove_item(Banana.new, 4)
    assert_equal(-1, entity.has_item_by_string("Banana"))
    assert_equal(0, entity.inventory.length)
  end

  def test_remove_complex
    entity = Entity.new("")

    entity.add_item(Banana.new, 3)
    entity.add_item(Bucket.new, 4)
    entity.add_item(Chub.new, 5)

    entity.remove_item(Bucket.new, 4)
    entity.remove_item(Banana.new, 2)
    entity.remove_item(Chub.new, 6)

    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)
    assert_equal(-1, entity.has_item_by_string("Bucket"))
    assert_equal(-1, entity.has_item_by_string("Chub"))

    assert_equal(1, entity.inventory.length)
  end
end
