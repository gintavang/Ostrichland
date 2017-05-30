class Pillow < Helmet
  def initialize
    super(name: "Pillow", price: 15, stat_change: { defense: 2 })
  end
end

class TinCan < Helmet
  def initialize
    super(name: "Tin Can", price: 55, stat_change: { defense: 4})
  end
end
