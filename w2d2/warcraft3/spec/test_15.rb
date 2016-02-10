require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege1 = SiegeEngine.new
    @siege2 = SiegeEngine.new
    @footman = Footman.new
    @peasant = Peasant.new
    @barracks = Barracks.new
    @living_unit = Unit.new(100, 100)
    @dead_unit = Footman.new(0, 100)
  end

  describe "#damage" do
    it "cannot attack other unit, other than siege engine" do
      @siege1.attack!(@footman)
      expect(@footman.health_points).to eq(60)
    end

    it "damages 2x power against a barracks" do
      attack = @siege1.power_times_two
      @barracks.attacked_by_siege(attack)
      expect(@barracks.health_points).to eq(400)     
    end

    it "attacks other siege engine" do
      @siege1.attack!(@siege2)
      expect(@siege2.health_points).to eq(350)
    end 

    it "attacks between non sieges, Footman vs Peasant" do
      @peasant.attack!(@footman)
      expect(@footman.health_points).to eq(50)
    end

    it "will not attack Footman because it is dead" do
      @living_unit.attack!(@dead_unit)
      expect(@dead_unit.health_points).to eq(0)
    end

    it "cannot attack another unit because Footman is dead" do
      @dead_unit.attack!(@living_unit)
      expect(@living_unit.health_points).to eq(100)
    end
  end
  
end