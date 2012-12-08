require 'spec_helper'

describe Player do
  it "has a name" do
    player = Player.new("Name")
    player.name.should == "Name"
  end

  it "has a symbol" do
    player = Player.new("Name", "o")
    player.symbol.should == "o"
  end

  it "should be possible to make move" do
    player = Player.new("Name", "o")
    player.make_move(0,1)
    player.current_move.x.should == 0
    player.current_move.y.should == 1
  end
end
