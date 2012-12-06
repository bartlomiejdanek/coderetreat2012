require "matrix"

class SetableMatrix < Matrix
  public :"[]=", :set_element, :set_component

=begin
  def diagonals
    Array.new.tap do |result|
      (0..diagonal_count-1).each do |i|
        result = get_diagonal
      end
    end
  end

  private

  def get_diagonal
     max_index =  row_size - 1
     @vectors = []

     row_size.times do |idx|
       arr_x = Array.new((diagonal_count - (idx *2)), idx)
       (max_index..0+idx).each_with_index do |i, v|
         arr_x[i] = v
       end

       arr_y = arr_x.reverse

       @vectors << [arr_x, arr_y].transpose
     end

      throw @vectors.inspect
  end

  def diagonal_count
    (row_size * 2) - 1
  end

#a = SetableMatrix.build(3, 3) { nil }
#a.diagonals
=end

end
