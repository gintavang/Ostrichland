require_relative '../Event/NPC/npc_zdrasvootyay.rb'
require_relative 'map.rb'
require_relative 'tile.rb'

class Zdrasvootyay < Map

	def initialize
		@name = "Zdrasvootyay"
		
		@tiles = [

			#0 top border
			[Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false)
		  ],

		  #1
		  [Tile.new(false), Tile.new(true), Tile.new(false),
		   Tile.new(true), Tile.new(true), Tile.new(true),
		   Tile.new(false)
		  ],

		  #2
		  [Tile.new(false), Tile.new(true), Tile.new(true),
		   Tile.new(true), Tile.new(true), Tile.new(true),
		   Tile.new(false)
		  ],
		  #3
		  [Tile.new(false), Tile.new(true), Tile.new(false),
		   Tile.new(true), Tile.new(true), Tile.new(true),
		   Tile.new(false)
		  ],

		  #4
		  [Tile.new(false), Tile.new(true), Tile.new(true),
		   Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false)
		  ],

		  #5
		  [Tile.new(false), Tile.new(false),
			 Tile.new(true, [Fisherwoman.new]),
		   Tile.new(true),
			 Tile.new(true, [Fisherman.new]),
			 Tile.new(false),Tile.new(false)
		  ],

		  #6
		  [Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false), Tile.new(true), Tile.new(false),
		   Tile.new(false)
		  ],

		  #7
		  [Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false), Tile.new(true), Tile.new(true), 	#<-ship
		   Tile.new(false)
		  ],

		  #8 bottom border
		  [Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false)
			]
		]
	end
end
