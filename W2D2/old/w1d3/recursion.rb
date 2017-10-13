require 'byebug'

def range(num1, num2)
  return [num2-1] if num1 == num2 - 1

  [num1] + range(num1 + 1, num2)
end

def sum_iterative(arr)
  arr.inject {|sum, elem| sum += elem}
end

def sum_recursive(arr)
  return arr[0] if arr.length == 1

  arr.shift + sum_recursive(arr)
end

def exponentiation_iterative(b, n)
  sum = 1
  n.times do |i|
    sum = sum * b
  end
  sum
end

def exponentiation_1(b, n) #exponentiation_1(3, 3) => 27
  return 1 if n == 0

  b * exponentiation_1(b, n - 1)
end

def exponentiation_2(b, n) #exponentiation_1(3, 4) => 81
  return 1 if n == 0
  return b if n == 1

  if n.even?
    recursive_result = exponentiation_2(b, n / 2)
    recursive_result * recursive_result
  elsif n.odd?
    recursive_result = exponentiation_2(b, (n - 1) / 2)
    b * recursive_result * recursive_result
  end
end

class Array
  def my_flatten(result = [])

    self.each do |elem|
      if elem.is_a?(Array)
        elem.deep_dup(result)
      else
        result << elem
      end
    end

    result
  end


  def deep_dup
    result = []
    self.each do |elem|
      if elem.is_a?(Array)
        result << elem.deep_dup
      else
        result << elem
      end
    end
    result
  end
end

def fibonacci_iterative(n)
  return [1] if n == 1
  fib_array = [1, 1]
  until fib_array.length == n
    fib_array << fib_array[-2] + fib_array[-1]
  end
  fib_array
end

def fibonacci_recursive(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  last_array = fibonacci_recursive(n-1)
  last_array + [(last_array[-1] + last_array[-2])]
end

def subsets(array) #subsets([1]) => [[], [1]]
  return [[]] if array == []
  val = array.pop
  frame_els = []
  last = subsets(array)
  last.each { |el| frame_els << [val] + el }
  last + frame_els
end

def subs(array)
  return [[]] if array.empty?
  val = array[0]
  frame_els = []
  last = subsets(array[1..-1])
  last.each { |el| frame_els << [val] + el }
  last + frame_els
end

def factorial(n)
  return 1 if n == 1
  n * factorial(n-1)
end

def permutations(arr)
  return [arr] if arr.length == 1
  last = permutations(arr[1..-1])
  values = []
  last.each do |elem|
    (elem.length+1).times do |i|
      values << elem.take(i) + [arr[0]] + elem.drop(i)
    end
  end

  return values

end

def perm(arr)
  return [arr] if arr.length == 1
  vals = []
  arr.length.times do |i|
    new_arr = arr[0...i] + arr[i+1..-1]
    vals += perm(new_arr).map { |el| el.unshift(arr[i]) }
  end
  vals
end

def bsearch(arr, target)
  return nil if arr.empty?
  middle_idx = arr.length / 2
  if target < arr[middle_idx]
    return bsearch(arr[0...middle_idx], target)
  elsif target > arr[middle_idx]
    result_idx = bsearch(arr[middle_idx + 1..-1], target)
    if result_idx
      return result_idx + middle_idx + 1
    else
      return result_idx
    end
  else
    return middle_idx
  end

end

def merge_sort(arr)
  return arr if arr.length <= 1

  # debugger
  middle = (arr.length/2)
  left = arr[0..middle]
  right = arr[(middle+1)..-1]

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge_helper(sorted_left, sorted_right)
end

def merge_helper(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  # result.concat(left).concat(right)
  result + left +right
end
