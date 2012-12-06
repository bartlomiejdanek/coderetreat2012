class Game
  attr_accessor :board
  attr_reader :players, :current_player

  def initialize
    @size = 20
    @players = []
    @current_player = nil

    configure_game
    main_loop
  end

  def configure_game
    @board = GameBoard.new(@size)

    add_player("Stevo", "X")
    add_player("Niby komp", 'O')
    @current_player = @players.first

  end


  def main_loop
    while board.valid?
      board.print
      current_player.make_move
      break if (@winner = board.check_winner)
      switch_player
    end
    board.print
    puts @players.find{|player| player.symbol == @winner}.name
  end

  private

  def switch_player
    @current_player = @players.rotate!.first
  end

  def add_player(name, symbol)
    @players.push Player.new(name, symbol, @board)
  end
end
