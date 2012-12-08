require 'spec_helper'

describe 'Game' do
  it "have 2 defined players" do
    game = Game.new
    game.players.count.should == 2
  end

  it "should possible to add players" do
    game = Game.new
    expect { game.add_player "Player3", "x" }.to change{game.players.count}.by(1)
  end

  it "have default board" do
    game = Game.new
    game.board.should_not be_nil
    game.board.size.should == 3
  end

  it "has custom board size" do
    game = Game.new(4)
    game.board.size.should == 4
  end

  it "should be possible to start a game", :pending do
    game = Game.new
    game.start
  end

  it "should be possible to mark a board" do
    game = Game.new
    player = game.current_player
    player.stub(:make_move) { Struct.new(:x,:y).new(1,1) }
    game.make_move
    game.board[1,1].should == player.symbol
  end

  it "players should take turns" do
    game = Game.new
    player = game.current_player
    player.stub(:make_move) { Struct.new(:x,:y).new(1,1) }
    game.make_move
    game.current_player.should_not == player
  end

  it "should be possible to switch players" do
    game = Game.new
    player = game.current_player
    game.switch_player
    game.current_player.should_not == player
  end

  it "should detect winning conditions" do
    winning_board = Board.new { [['o','x',nil],['o','x',nil],['o',nil,nil]] }
    game = Game.new
    game.stub(:board) {winning_board}
    game.check_for_winner.should == 'o'
  end

end
