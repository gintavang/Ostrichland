require "test/unit"
require_relative "../src/Map/map_zdrasvootyay.rb"

class TestMap < Test::Unit::TestCase

	def test_map_construction
		test_map = Zdrasvootyay.new
		assert_equal(false, test_map.tiles[3][2].passable)
	end

end
