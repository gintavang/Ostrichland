require 'goby'
include Goby
include Driver

require_relative 'entity/hero.rb'
require_relative 'map/zdrasvootyay.rb'

system("clear")

if File.exists?("player.yaml")
  print "Load the saved file?: "
  input = player_input
  if input.is_positive?
    hero = load_game("player.yaml")
    describe_tile(hero)
  else
    hero = Hero.new
  end
else
  hero = Hero.new
end

run_driver(hero)
