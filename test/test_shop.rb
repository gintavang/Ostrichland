require_relative "../src/entity_item.rb"
require_relative "../src/shop.rb"

e = Entity.new("")
e.gold += 1000
s = ZdrasShop.new

s.run e
