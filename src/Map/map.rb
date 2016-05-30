class Map

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
