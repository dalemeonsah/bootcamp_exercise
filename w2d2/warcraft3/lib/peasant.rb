require_relative 'unit'

class Peasant < Unit
  
  def initialize(health_points = 35, attack_power = 10)

    super(health_points, attack_power)
    
  end
end