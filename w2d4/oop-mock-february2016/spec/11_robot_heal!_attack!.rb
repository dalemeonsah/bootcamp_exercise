require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @target = Item.new("Potion", 10)
  end

  describe "#heal!" do
    it "should raise an exception if robot's health <= 0" do
      expect(@robot).to receive(:health).and_return(0)
      expect{@robot.heal!}.to raise_error(RobotAlreadyDeadError, "Health is 0 or less now!")
    end
  end

  describe "#attack!" do
    it "should raise an exception if the target being attacked is not a robot." do
      expect{@robot.attack!(@target)}.to raise_error(UnattackableEnemy, "It is not a robot!")
    end
  end

end