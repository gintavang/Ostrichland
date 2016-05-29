require 'test/unit'


class Tile

	def initialize(passable)
		@passable = passable
		@seen = false
		#@shops = shops
		#@people = people
		#@monsters = monster
	end

	attr_accessor :passable, :seen

end
