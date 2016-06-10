require_relative '../Event/NPC/npc_zdrasvootyay.rb'
require_relative '../Event/Shop/shop_zdrasvootyay.rb'
require_relative '../Event/event.rb'
require_relative '../Event/gamble.rb'
require_relative '../Event/plant.rb'
require_relative '../Event/pool.rb'
require_relative '../Event/stove.rb'
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
		  [Tile.new(false),
			 Tile.new(true, [BananaDictionaryTree.new]),
			 Tile.new(false),
		   Tile.new(true, [TheTools.new]),
			 Tile.new(true),
			 Tile.new(true, [RestEvent.new, Stove.new]),
		   Tile.new(false)
		  ],

		  #2
		  [Tile.new(false), Tile.new(true),
			 Tile.new(true, [Soldier.new]),
		   Tile.new(true), Tile.new(true), Tile.new(true),
		   Tile.new(false)
		  ],
		  #3
		  [Tile.new(false),
			 Tile.new(true, [BananaTree.new]),
			 Tile.new(false),
		   Tile.new(true, [ZdrasShop.new]),
			 Tile.new(true, [TopHatSlots.new]), Tile.new(true),
		   Tile.new(false)
		  ],

		  #4
		  [Tile.new(false), Tile.new(true), Tile.new(true),
		   Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false)
		  ],

		  #5
		  [Tile.new(false), Tile.new(false),
			 Tile.new(true, [Fisherwoman.new, BluegillPool.new]),
		   Tile.new(true, [BluegillPool.new]),
			 Tile.new(true, [Fisherman.new, BluegillPool.new]),
			 Tile.new(false),Tile.new(false)
		  ],

		  #6
		  [Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false), Tile.new(true, [Russian.new, BluegillPool.new]), Tile.new(false),
		   Tile.new(false)
		  ],

		  #7
		  [Tile.new(false), Tile.new(false), Tile.new(false),
		   Tile.new(false),
			 Tile.new(true, [BluegillPool.new]),
			 Tile.new(true, [BluegillPool.new]), 	#<-ship
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
