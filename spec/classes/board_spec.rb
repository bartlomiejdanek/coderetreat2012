require 'spec_helper'

describe Board do
  it 'should respond with proper size' do
    board = Board.new(4)
    board.size.should == 4
  end

  it 'should detect winner' do

    winning_board = Board.new {[['o','x',nil],['o','x',nil],['o',nil,nil]]}
    winning_board.check_winner.should == 'o'
  end
end
