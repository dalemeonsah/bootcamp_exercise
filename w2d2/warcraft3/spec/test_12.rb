require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#dead?" do
    it "returns true if HP is less than or equal to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end
  end

end