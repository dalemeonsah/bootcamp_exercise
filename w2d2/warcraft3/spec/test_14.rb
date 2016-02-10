require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

  it "returns true if there are enough resources to train a footman" do
    expect(@barracks.can_train_footman?).to be_truthy
  end

  it "returns false if there isn't enough lumber" do
    expect(@barracks).to receive(:lumber).and_return(9)
    expect(@barracks.can_train_footman?).to be_falsey
  end

end