require_relative 'spec_helper'

describe Unit do

  before :each do
    @living_unit = Unit.new(100, 100)
    @dead_unit = Unit.new(0, 100)
  end

  describe "#attack!" do
    it "cannot attack another unit" do
      @dead_unit.attack!(@living_unit)
      expect(@living_unit.health_points).to eq(100)
    end

    it "will not also attack another unit that is already dead" do
      @living_unit.attack!(@dead_unit)
      expect(@dead_unit.health_points).to eq(0)
    end
  end

end