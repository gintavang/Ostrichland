class Bucket < Item
  def initialize
    super(name: "Bucket", price: 2)
  end
end

class BurntFlub < Item
  def initialize
    super(name: "Burnt Flub")
  end
end

class FishingPole < Item
  def initialize
    super(name: "Fishing Pole", price: 15)
  end
end

class Fuel < Item
  def initialize
    super(name: "Fuel", price: 30)
  end
end

class RussianDictionary < Item
  def initialize
    super(name: "Russian-English Dictionary")
  end
end
