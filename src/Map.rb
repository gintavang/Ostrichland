require 'Tile.rb'

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
end

class Zdrasvootyay

	


