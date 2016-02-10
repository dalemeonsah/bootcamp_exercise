require_relative 'unit'

class SiegeEngine < Unit

  attr_accessor :gold, :lumber, :food

  def initialize(health_points = 400, attack_power = 50)
    
    super(health_points, attack_power)
    @gold = 200
    @lumber = 60
    @food = 3
  end

  def power_times_two
    self.attack_power * 2
  end

end