class GameBoard

  def initialize
    @matrix = SetableMatrix.build(3, 3) { nil }
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
