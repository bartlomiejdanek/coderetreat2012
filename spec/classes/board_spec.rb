require 'spec_helper'

describe Board do
  it "should be possible to find winner" do
    board = Board.new { [['o','x',nil],['o','x',nil],['o',nil,nil]] }
    board.find_winner.should == 'o'
  end

  it 'should have diagonal slices' do
    board = Board.new { [[1,2,3],[4,5,6],[7,8,9]] }
    board.diagonal_slices.should == [[1],[4,2], [7,5,3], [8,6], [9]]
  end

  it 'should return correct diagonal slice coords' do
    board = Board.new(3)
    board.diagonal_slice_coords.should == [[0,0],[1,0],[0,1],[2,0],[1,1],[0,2],[2,1],[1,2],[2,2]]
  end
end
