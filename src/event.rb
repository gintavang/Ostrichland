class Event

  def run(entity)
    puts "Unable to run an abstract event!"
  end

  attr_accessor :command
end
