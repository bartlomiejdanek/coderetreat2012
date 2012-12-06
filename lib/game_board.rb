class GameBoard

  def initialize
    @matrix = Array2D.new(3)
  end

  def valid?
    @matrix.rows.flatten.any?(&:nil?)
  end

  def print
    system('clear')
    print_row_separator
    @matrix.rows.each do |row|
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
