require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#wound" do
    it "decreases shield" do
      @robot.wound(20)
      expect(@robot.shield).to eq(30)
    end

    it "doesn't decrease shield below 0" do
      @robot.wound(150)
      expect(@robot.shield).to eq(0)
    end

    it "does hit shield until 0 then decrease health" do
      @robot.wound(150)
      @robot.wound(150)
      expect(@robot.shield).to eq(0)
      expect(@robot.health).to eq(0)
    end
  end
end