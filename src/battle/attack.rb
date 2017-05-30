class FlingRock < Attack
	def initialize
		super(name: "Fling Rock", strength: 15, success_rate: 75)
	end
end

class FrothyBite < Attack
  def initialize
		super(name: "Frothy Bite", strength: 5, success_rate: 25)
  end
end

class Kick < Attack
	def initialize
		super(name: "Kick", strength: 2, success_rate: 99)
	end
end

class PitifulGroan < Attack
	def initialize
		super(name: "Pitiful Groan", strength: 2, success_rate: 75)
	end
end

class Uppercut < Attack
  def initialize
		super(name: "Uppercut", strength: 5, success_rate: 80)
  end
end

class Wack < Attack
	def initialize
		super(name: "Wack", strength: 8, success_rate: 99)
	end
end