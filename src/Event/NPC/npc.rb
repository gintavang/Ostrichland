require_relative '../event.rb'

class NPC < Event

  def initialize
    super
    @command = "talk"
  end

  def run(entity)
    puts "Hello!"
  end

  attr_accessor :name

end
