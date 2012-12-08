require "spec_helper"

describe Game do
  it "should have a players" do
    game = Game.new
    game.players.count.should == 2
  end

  it "should be possible to add player" do
    game = Game.new
    expect { game.add_player 'PlayerName', '?' }.to change{game.players.count}.by(1)
  end

  it 'should have standard board' do
    game = Game.new
    game.board.should_not be_nil
    game.board.size.should == 3
  end

  it 'should be possible to make move' do
    game = Game.new
    player = game.current_player
    player.stub(:make_move) { Struct.new(:x,:y).new(1,1) }
    game.make_move
    game.board[1,1].should == player.symbol
  end

  it 'should be possible to update board' do
    game = Game.new
    game.update_board(Struct.new(:x, :y).new(1,1))
    game.board[1,1].should == game.current_player.symbol
  end

  it 'should toggle players after move' do
    game = Game.new
    player = game.current_player
    player.stub(:make_move) { Struct.new(:x,:y).new(1,1) }
    game.make_move

    game.current_player.should_not == player
  end

  it 'should be possible to switch players' do
    game = Game.new
    current_player = game.current_player
    game.switch_players
    game.current_player.should_not == current_player
  end

  it 'should properly detect winner' do
    game = Game.new
    winning_board = Board.new {[['o','x',nil],['o','x',nil],['o',nil,nil]]}
    game.stub(:board) { winning_board }
    game.check_winner.should == 'o'
  end
end
