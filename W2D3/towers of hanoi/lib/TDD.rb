class TDD
  def my_uniq(array)
    result = []
    array.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def my_transpose
    array = [[0,1,2],[3,4,5],[6,7,8]]
      ## => [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
    result = []

    array.size.times do |i|
      row = []
      array[i].size.times do |j|
        row << array[j][i]
      end
      result << row
    end
    result
  end


  def stock_picker(array)
    max_profit = nil
    max_profit_days = []

    (0...array.length-1).each do |i|
      (i + 1..array.length-1).each do |j|
        profit = array[j] - array[i]
        if max_profit == nil || profit > max_profit
          max_profit = profit
          max_profit_days = [i, j]
        end
      end
    end
    max_profit_days
  end
end
