require_relative '../event.rb'

class NPC < Event

  def initialize
    @command = "talk"
  end

  def run(entity)
    puts "Hello!"
  end

  attr_accessor :name

end
