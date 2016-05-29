require "test/unit"
require_relative "../src/map.rb"
require_relative "../src/entity_item.rb"

class TestMap < Test::Unit::TestCase

	def test_map_construction
		test_map = Map.create :zdrasvootyay
		assert_equal(false, test_map.tiles[3][2].passable)
	end

end
