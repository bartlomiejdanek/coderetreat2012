class Array
  def find_winner(limit = 3)
    acc = {}
    self.each do |value|
      if acc.empty?
        acc[value] = 1
      else
        acc = {value => 0} if acc[value].nil?
        acc[value] += 1
        break if acc[value] == limit
      end
    end
    symbol = acc.keys.first
    acc[symbol] == limit ? symbol : nil
  end
end
