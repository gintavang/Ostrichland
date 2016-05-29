require "test/unit"
require_relative "../src/entity_item.rb"
require_relative "../src/plant.rb"

class TestBananaTree < Test::Unit::TestCase

  def test_trivial
    entity = Entity.new("")
    tree = BananaTree.new

    # Obtain the first Banana.
    tree.run(entity)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(1, count)

    # Obtain the remaining four Bananas.
    tree.run(entity); tree.run(entity);
    tree.run(entity); tree.run(entity);
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(5, count)

    # There should be no Bananas left.
    tree.run(entity)
    count = entity.inventory[entity.has_item_by_string("Banana")].second
    assert_equal(5, count)
  end
end
