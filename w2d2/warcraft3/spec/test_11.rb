require_relative 'spec_helper'

# Enhancement (1)
# In most strategy games, like Warcraft III, buildings can also be attacked by Units. 
# Since a Barracks is a building, it has substantially more HP (500). 
# Additionally, a Footman does only half of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

# The damage amount should be an integer (Fixnum), 
# but the ceiling (ceil) of the division should be used as the resulting amount.

describe Barracks do

  before :each do
    @barrack = Barracks.new
    @footman = Footman.new
  end

  describe "#damage" do
    it "should reduce the barracks' health_points by the attack_power half specified" do
      @footman.attack_power = 9.0
      @barrack.damage(@footman.attack_power)
      expect(@barrack.health_points).to eq(495) # HP started at 500 but just got hit by (9.0 / 2).ceil => 5  
    end
  end
  
end