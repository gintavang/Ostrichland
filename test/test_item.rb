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

class TestUseItem < Test::Unit::TestCase

  def test_trivial
    entity = Entity.new("", 5, 2)
    entity.add_item(Banana.new, 1)
    entity.use_item_by_string("Banana", entity)
    assert_equal(4, entity.hp)

    len = entity.inventory.length
    assert_equal(0, len)
  end

  def test_multiple
    entity = Entity.new("", 5, 1)
    entity.add_item(Banana.new, 3)

    entity.use_item_by_string("Banana", entity)
    count = entity.inventory[0].second
    assert_equal(2, count)
    len = entity.inventory.length
    assert_equal(1, len)

    entity.use_item_by_string("Banana", entity)
    count = entity.inventory[0].second
    assert_equal(1, count)

    entity.use_item_by_string("Banana", entity)
    len = entity.inventory.length
    assert_equal(0, len)
  end

end
