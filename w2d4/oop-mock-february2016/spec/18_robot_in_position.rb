require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

    describe "#self.in_position" do
    it "return an array of all the robots since multiple robots could potentially be at position 0,0" do
      Robot.add_robot(@robot1)
      Robot.add_robot(@robot2)
      Robot.add_robot(@robot3)
      expect(Robot.in_position(0,0)).to eq([@robot1, @robot2, @robot3])
    end

  end

end