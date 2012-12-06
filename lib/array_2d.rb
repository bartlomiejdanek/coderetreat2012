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

  def all_slices
    all_diagonal_slices + horizontal_slices + vertical_slices
  end

  def all_diagonal_slices
    diagonal_slices + reversed.diagonal_slices
  end

  def horizontal_slices
    rows
  end

  def vertical_slices
    rows.transpose
  end

  def diagonal_slices
    diagonal_slice_coords.map do |slice|
      slice.map do |x, y|
        self[x, y]
      end
    end
  end

  private

  def diagonal_slice_coords
    size = rows.size
    max_idx = size - 1
    stripes = (2 * size) - 1

    Array.new.tap do |result|
      (0..stripes-1).each do |n_stripe|
        stripe = []
        x = (n_stripe > max_idx) ? max_idx : n_stripe
        while x >= 0 do
          y = n_stripe - x
          break if y > max_idx
          stripe << [x, y]
          x-=1
        end
        result << stripe
      end
    end
  end
end