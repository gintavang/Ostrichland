require_relative 'entity_item.rb'

class Event

  def run(entity)
    puts "Unable to run an abstract event!"
  end

  attr_accessor :command
end
