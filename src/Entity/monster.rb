require_relative "entity.rb"

class Monster < Entity

		attr_accessor :visible
end

class HeadlessOstrich < Monster
	def initialize
		@name = "Headless Ostrich"
		@hp = 1
		@visible = true
		#@inventory = 
		#@attacks = 
		#treasures = []
	end

end