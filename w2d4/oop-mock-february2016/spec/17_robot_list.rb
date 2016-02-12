require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

    describe "#self.add_roboto" do
    it "should keep track of all robots that are instantiated" do
      Robot.add_robot(@robot)
      expect(Robot.total_robot).to eq(1)
    end

  end

end