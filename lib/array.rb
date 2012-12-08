class Array
  def find_siblings(min = 3)
    current_element = nil
    current_count = 0

    each do |element|
      if current_element != element
        current_count = 0
        current_element = element
      else
        current_count += 1
      end
      break if current_count == min
    end
    current_count == min ? current_element : nil
  end
end
