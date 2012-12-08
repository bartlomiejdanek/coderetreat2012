class Array2D
  attr_reader :rows

  def initialize(_size = 3, &block)
    @rows = if block_given?
              block.call
            else
              (0.._size-1).map { Array.new(_size, nil) }
            end
  end

  def reversed
    Array2D.new{ rows.reverse }
  end

  def [](x, y)
    rows[x][y]
  end

  def []=(x, y, v)
    @rows[x][y] = v
  end

 end
