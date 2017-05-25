require_relative 'tile.rb'
require_relative '../entity/monster.rb'
require_relative '../event/event.rb'
require_relative '../event/gamble.rb'
require_relative '../event/plant.rb'
require_relative '../event/pool.rb'
require_relative '../event/stove.rb'
require_relative '../event/zdrasvootyay.rb'
require_relative '../item/item.rb'

class Zdrasvootyay < Map

	def initialize
		super(name: "Zdrasvootyay", regen_location: Couple.new(2, 6))

		grass = Grass.new(monsters: [HeadlessOstrich.new, RabidCockerSpaniel.new])
		pier = Pier.new(events: [BluegillPool.new])
		stone = Stone.new
		wall = Wall.new
		water = Water.new

		# Fill the map with water.
		@tiles = Array.new(11) { Array.new(9) { water.clone } }

		# Walls of Zdrasvootyay.
		3.times do |i|
			@tiles[1][i+4] = wall.clone # Northern
			@tiles[5][i+4] = wall.clone # Southern
			@tiles[i+2][3] = wall.clone # Western
			@tiles[i+2][7] = wall.clone # Eastern
		end

		# Main square of Zdrasvootyay.
		3.times do |y|
			3.times do |x|
				@tiles[y+2][x+4] = stone.clone
			end
		end
		@tiles[3][3] = Stone.new(description: "The town guard stands here.",
														 events: [Soldier.new])
		@tiles[2][6] = Tile.new(description: "It's your house.",
														graphic: 'Д',
														events: [RestEvent.new, Stove.new])
		@tiles[2][4] = Tile.new(description: "This is the Tools Store.",
														graphic: '△',
														events: [ToolStore.new])
		@tiles[4][4] = Tile.new(description: "It's the local family-owned Zdras Shop.",
														graphic: '△',
														events: [ZdrasShop.new])
		@tiles[4][5] = Tile.new(description: "This is the gambling hall, Top Hat Slots.",
														graphic: '♧',
														events: [TopHatSlots.new])

		# Grassy area outside Zdrasvootyay.
		4.times { |y| @tiles[y+2][2] = grass.clone }
		@tiles[5][3] = grass.clone
		@tiles[2][2].events = [BananaDictionaryTree.new]
		@tiles[4][2].events = [BananaTree.new]

		# Zdrasvootyay pier.
		2.times do |i|
			@tiles[i+5][3] = pier.clone
			@tiles[6][i+4] = pier.clone
			@tiles[i+7][5] = pier.clone
		end
		@tiles[8][6] = pier.clone
		@tiles[6][3].events << Fisherwoman.new
		@tiles[6][5].events << Fisherman.new
		@tiles[8][5].events << Russian.new

	end
end
