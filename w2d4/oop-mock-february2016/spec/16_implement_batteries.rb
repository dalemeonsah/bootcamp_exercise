require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

    describe "#shield" do
    it "increases shield" do
      @robot.wound(40)
      @robot.heal_shield(20)
      expect(@robot.shield).to eq(30)
    end

    it "doesn't increase shield over 100" do
      @robot.heal_shield(10)
      expect(@robot.shield).to eq(50)
    end
  end

end