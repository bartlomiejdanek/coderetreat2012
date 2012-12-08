class Game
  attr_reader :players, :board, :current_player
  def initialize(board_size = 3)
    setup_players
    @board = ::Board.new(board_size)
  end

  def add_player name, symbol
    @players << Player.new(name, symbol)
  end

  def start
    puts "A"
  end

  def make_move
    update_board current_player.make_move
    switch_player
  end

  def check_for_winner
    board.find_winner
  end

  def switch_player
    @current_player = @players.rotate!.first
  end

  private

  def update_board(move)
    board[move.x, move.y] = current_player.symbol
  end

  def setup_players
    @players = []
    add_player("Player1", "o")
    add_player("Player2", "x")
    @current_player = players.first
  end
end
