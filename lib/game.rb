class Game
  attr_accessor :board
  attr_reader :players, :current_player

  def initialize
    @players = []
    @current_player = nil

    configure_game
    main_loop

  end

  def configure_game
    @board = GameBoard.new
    add_player("Stevo", "X")
    add_player("Niby komp", 'O')
    #@board.add_player(AiPlayer.new("Komp"))
  end

  def current_player
    @current_player ||= players.shuffle.first
  end

  def main_loop
    while board.valid?
      board.print
      current_player.make_move
      break if (@winner = board.check_winner)
      switch_player
    end
    puts @winner.name
  end

  private

  def switch_player
    @current_player = (players - [current_player]).first
  end

  def add_player(name, symbol)
    @players.push Player.new(name, symbol, @board)
  end
end
