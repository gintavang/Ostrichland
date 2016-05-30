class Tile

	def initialize(passable, events = [])
		@passable = passable
		@seen = false
		@events = events
		#@monsters = monster
	end

	attr_accessor :passable, :seen, :events

end
