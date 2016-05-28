require_relative 'tile.rb'
#require 'test/unit'

class Map
	#place - town/region in the Map
	def self.create(place)
		case place
			#starting island
			when :zdrasvootyay
				Zdrasvootyay.new
			#else
				#Zdrasvootyay.new
		end
	end

	def print_map
    puts ""
    @tiles.each do |sub|
      sub.each do |tile|
        if tile.passable
          print "1"
        else 
          print "0"
        end
      end
    puts ""
    end
  end

	attr_accessor :tiles

end

class Zdrasvootyay < Map
	
	def initialize

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
		  [Tile.new(false), Tile.new(false), Tile.new(true),
		   Tile.new(true), Tile.new(true), Tile.new(false),
		   Tile.new(false)
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






