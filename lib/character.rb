class Character
  attr_reader :name,
              :actor,
              :salary

  def initialize(attributes)
    @name   = attributes[:name]
    @actor  = attributes[:actor]
    @salary = attributes[:salary]
  end

  def bankroll?
    salary > 500_000
  end

  def upcase?
    name == name.upcase
  end
end
