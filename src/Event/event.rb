class Event

  def initialize
    # Can be used in a case statement in run for different outcomes.
    @mode = 0

    # The event can only be activated when this is true.
    @visible = true
  end

  def run(entity)
    puts "Unable to run an abstract event!"
  end

  attr_accessor :command, :mode, :visible
end
