class Game
  attr_accessor :board

  def initialize
    configure_game
    main_loop
  end

  def configure_game
    @board = GameBoard.new
    @board.add_player("Stevo", "X")
    @board.add_player("Niby komp", 'O')
    #@board.add_player(AiPlayer.new("Komp"))
  end

  def main_loop

    while board.valid?
      board.print
      board.current_player.make_move
      break if (@winner = board.check_winner)
      board.switch_player
    end
    puts @winner.name
  end
end
