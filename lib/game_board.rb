class GameBoard

  def initialize(_size=3)
    @size = _size
    @matrix = Array2D.new(@size)
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
    @matrix.all_slices.each do |slice|
      if (symbol = slice.find_first_siblings(3))
      return symbol
        end
    end
    false
  end

  private

  def print_row_separator
    puts Array.new(@size, ' -').join
  end

  def print_row(data)
    puts "|#{data.map { |symbol| symbol || ' ' }.join('|')}|"
  end

end
