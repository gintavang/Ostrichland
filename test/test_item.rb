require "test/unit"
require_relative "../src/Entity/entity.rb"
require_relative "../src/Item/food.rb"

class TestFoodRecovery < Test::Unit::TestCase

  def test_trivial
    entity = Entity.new("", 5, 2)
    banana = Banana.new
    banana.use entity
    assert_equal(4, entity.hp)
  end

  def test_exceed_max
    entity = Entity.new("", 5, 4)
    banana = Banana.new
    banana.use entity
    assert_equal(5, entity.hp)
  end

end
