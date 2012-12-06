class GameBoard
  attr_reader :players, :current_player

  def initialize
    @matrix = SetableMatrix.build(3, 3) { nil }
    @players = []
    @current_player = nil
  end

  def add_player(name, symbol)
    @players.push Player.new(name, symbol, self)
  end

  def current_player
    @current_player ||= players.shuffle.first
  end

  def switch_player
    @current_player = (players - [current_player]).first
  end

  def valid?
    @matrix.to_a.flatten.any?(&:nil?)
  end

  def print
    system('clear')
    print_row_separator
    @matrix.to_a.each do |row|
      print_row(row)
      print_row_separator
    end
  end

  def mark(x, y, player)
    @matrix[x, y] = player
  end

  def check_winner
    false
  end

  private

  def print_row_separator
    puts Array.new(3, ' -').join
  end

  def print_row(data)
    puts "|#{data.map { |x| x ? x.symbol : ' ' }.join('|')}|"
  end

end
