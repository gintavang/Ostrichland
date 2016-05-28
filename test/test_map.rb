=begin
require "test/unit"
require_relative "../src/map.rb"

class TestMap < Test::Unit::TestCase

	def basic_map_construction
		testmap = Map.create(:zdrasvootyay)
		assert_equal(true, testmap[3][2])
	end
end
=end

require "test/unit"
require_relative "../src/map.rb"
require_relative "../src/entity_item.rb"

class TestMap < Test::Unit::TestCase

	def test_trivial
    entity = Entity.new("", 5, 2)
    banana = Item.create "Banana"
    banana.use entity
    assert_equal(4, entity.hp)
  end

  def basic_map_construction
		#testmap = Map.create(:zdrasvootyay)
		assert_equal(true, testmap.tiles[3][2])
	end

end