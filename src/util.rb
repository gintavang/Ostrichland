class Couple
  def initialize(first, second)
    @first = first
    @second = second
  end
  attr_accessor :first, :second
end

#prints text as if it were being typed
#with optional maximum line setting
#recommended max_line setting ~40
def type(message, max_line = 0)
  count = 0
  message.split("").each do |i|
    count += 1
    sleep(0.02)
    print i
    if (max_line != 0)
      if (i == " " && count > max_line)
        print "\n"
        count = 0
      end
    end
  end
end
