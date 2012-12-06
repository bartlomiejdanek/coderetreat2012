class Player < Struct.new(:name, :symbol, :board)
  def make_move
    puts "Player #{name}: X,Y"
    coords = gets
    x, y = coords.split(',').map(&:to_i)

    board.mark(x-1, y-1, self.symbol)
  end
end
