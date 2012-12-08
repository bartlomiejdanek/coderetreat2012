class Player < Struct.new(:name, :symbol)
  attr_reader :current_move
  def make_move(x, y)
    @current_move = Struct.new(:x, :y).new(x, y)
  end
end
