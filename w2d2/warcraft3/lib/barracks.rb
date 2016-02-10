class Barracks
  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def damage(attack)
    self.health_points -= (attack.to_f / 2).ceil
  end

  def attacked_by_siege(attack)
    self.health_points -= attack
  end

  def train_footman
    @gold -= 135
    @food -= 2
    @lumber -= 10
    can_train_footman? ? Footman.new : nil
  end

  def train_peasant
    @gold -= 90
    @food -= 5

    can_train_peasant? ? Peasant.new : nil
  end

  def can_train_peasant?
    food > 4 && gold > 89
  end

  def can_train_footman?
    food >= 2 && gold >= 135 && lumber >= 10
  end
end