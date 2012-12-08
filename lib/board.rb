class Board < Array2D
  def size
    rows.size
  end

  def columns
    rows.transpose
  end

  def check_winner
    (rows).each do |slice|
      slice.find_siblings(3)
    end
  end

end
