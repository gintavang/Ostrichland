class Tile

	def initialize(passable, events = [], description = nil)
		@passable = passable
		@seen = false
		@events = events
		@description = description
		#@monsters = monster
	end

	attr_accessor :passable, :seen, :events, :description

end
