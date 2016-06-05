require_relative "../entity.rb"

class Attack

	attr_accessor :name, :damage, :success_rate
end

class Kick < Attack

	@name = "kick"
	@damage = 1
	@success_rate = 99

end

