class Tile

	def initialize(passable, description = nil, events = [])
		@passable = passable
		@seen = false
		@description = description
		@events = events
		#@monsters = monster
	end

	attr_accessor :passable, :seen, :description, :events

end
