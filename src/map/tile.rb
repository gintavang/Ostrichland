class Grass < Tile
  def initialize(monsters: [])
    super(description: "You're standing on some grass.", monsters: monsters)
  end
end

class Pier < Tile
  def initialize(events: [])
    super(description: "You're standing on a fishing pier.", events: events, graphic: '☰')
  end
end

class Stone < Tile
  def initialize(description: "You're standing on some stone.", events: [])
    super(description: description, events: events, graphic: '□')
  end
end

class Wall < Tile
  def initialize
    super(passable: false)
  end
end

class Water < Tile
  def initialize
    super(passable: false, graphic: '≈')
  end
end