class Robot
  MAX_WEIGHT = 250
  DEFAULT_ATTACK = 5
  MAX_HEALTH = 100

  attr_accessor :position, :items, :health, :equipped_weapon, :shield

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    @equipped_weapon = nil
    @shield = 50
  end

  class RobotAlreadyDeadError < StandardError
  end

  def heal!
    begin
    raise RobotAlreadyDeadError, "Health is 0 or less now!" if self.health <= 0
    rescue StandardError
    heal(20)
    end
  end

  def attack!(robot)
    if robot.is_a? Robot
      attack(robot)
    else
      raise UnattackableEnemy, "It is not a robot!"
    end 
  end

  def attack(robot)
    block_difference = (self.position[1] - robot.position[1]).abs

    # Wound enemy within 1 block
    if block_difference < 2
      if equipped_weapon
        equipped_weapon.hit(robot)
      else 
        robot.wound(DEFAULT_ATTACK)
      end

    # Will wound enemy no matter the block difference
    elsif (equipped_weapon.is_a? Grenade) && block_difference < 3
      equipped_weapon.hit(robot)
      @equipped_weapon = nil
    end

  end

  def wound(decrease_health)
    @health -= decrease_health
    if @health < 0
      @health = 0
    end
  end

  def heal(increase_health)
    @health += increase_health
    if @health > MAX_HEALTH
      @health = MAX_HEALTH
    end
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(an_item)
 
    if an_item.is_a? Weapon
      self.equipped_weapon = an_item
    end

    if (an_item.is_a? BoxOfBolts) && (health <= 80)
      an_item.feed(self)
    end

    items << an_item if items_weight + an_item.weight <= MAX_WEIGHT
  end

  def items_weight
    items.reduce(0) {|sum, item| sum + item.weight}
  end
end
