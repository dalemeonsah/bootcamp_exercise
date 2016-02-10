#require_relative 'siege_engine'

class Unit
  attr_accessor :attack_power, :health_points

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    
    if enemy.instance_of?(SiegeEngine) && self.instance_of?(SiegeEngine)
      dead_check(enemy)
    elsif !enemy.instance_of?(SiegeEngine) && !self.instance_of?(SiegeEngine)
      dead_check(enemy)
    end
    
  end

  def dead_check(enemy)
    if (dead? || enemy.dead?) == false
      enemy.damage(attack_power)
    end
  end

  def damage(attack)
    @health_points -= attack
  end

  def dead?
    self.health_points <= 0
  end

end