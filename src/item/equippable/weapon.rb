class Slingshot < Weapon
  def initialize
    super(name: "Slingshot", price: 40, stat_change: {attack: 1},
          attack: FlingRock.new)
  end
end

class Stick < Weapon
  def initialize
    super(name: "Stick", price: 10, stat_change: {attack: 1},
          attack: Wack.new)
  end
end
