# Fully restores the entity's HP and possibly
# other attributes (status, MP, etc.)
class RestEvent < Event

  def initialize
    super
    @command = "rest"
  end

  def run(entity)
    entity.hp = entity.max_hp
    print "#{entity.name}'s HP is fully restored!\n\n"
  end

end
