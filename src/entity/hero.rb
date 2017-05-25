require_relative '../battle/attack.rb'

# Main character.
class Hero < Player
  def initialize
    super(name: "Hero",
          max_hp: 100, hp: 100,
          attack: 3, defense: 2,
          battle_commands: [Kick.new, Escape.new],
          map: Zdrasvootyay.new,
          location: Couple.new(2, 6))
  end
end