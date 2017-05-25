class Banana < Food
  def initialize
    super(name: "Banana", price: 2, recovers: 2)
  end
end

class Bluegill < Food
  def initialize
    super(name: "Bluegill", price: 12, recovers: 6)
  end
end
