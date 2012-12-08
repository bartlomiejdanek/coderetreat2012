class Game
  attr_reader :players, :board, :current_player
  def initialize
    @board = Board.new
    setup_players
  end

  def add_player name, symbol
    @players << Player.new(name, symbol)
  end

  def make_move
    update_board current_player.make_move
    switch_players
  end

  def update_board(move)
    @board[move.x, move.y] = current_player.symbol
  end

  def switch_players
    @current_player = @players.rotate!.first
  end

  def check_winner
    board.check_winner
  end

  private

  def setup_players
    @players = []
    add_player "Player1", 'o'
    add_player "Player2", 'x'
    @current_player = players.first
  end

end
