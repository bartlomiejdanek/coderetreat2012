require 'spec_helper'

describe Player do
  it 'should have a name and symbol' do
    player = Player.new('PlayerName', '?')
    player.name.should == 'PlayerName'
    player.symbol.should == '?'
  end

  it 'should be possible to make move' do
    player = Player.new('PN', 'x')
    player.make_move(1,2)
    player.current_move.x.should == 1
    player.current_move.y.should == 2
  end
end
