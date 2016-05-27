require 'test/unit'


class Tile

	def initialize(passable)
		@passable = passable
		@seen = false
		#@shops = shops
		#@people = people
		#@monsters = monster
	end
	
	attr_accessor :passable, seen

end

class TestTiles < Test::Unit::TestCase
	def test_simple
		assert_equal(true, Tile.new(true).passable)
	end
end


