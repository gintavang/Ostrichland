require "test/unit"
require_relative "../src/entity_item.rb"

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
