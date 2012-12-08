class Board < Array2D
  def size
    rows.size
  end

  def find_winner
    all_slices.each do |slice|
      winner = slice.find_siblings(3)
      return winner if winner
    end
    nil
  end

  def diagonal_slices

  end

  def diagonal_slic_coords
    max_ids = size - 1
    stripes = (2*size) - 1

    Array.new.tap
  end

  def all_slices
    rows + columns
  end
end
