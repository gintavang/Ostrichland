require_relative "../src/Entity/entity.rb"
require_relative "../src/Event/Shop/shop_zdrasvootyay.rb"

e = Entity.new("")
e.gold += 1000
s = ZdrasShop.new

s.run e
