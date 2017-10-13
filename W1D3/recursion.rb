# Warmup
#
# Write a recursive method, range, that takes a start and an end and
# returns an array of all numbers in that range, exclusive. For example,
# range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return
# an empty array. Write both a recursive and iterative version of sum of
# an array.

def range(start, ending)

  return [] if ending < start

  arr = (start...ending).to_a


  return arr if arr.length <= 1

  [start] + range(start + 1, ending)

end
puts "range: "
p range(1, 5) == [1, 2, 3, 4]
p range(3, 2) == []
puts "------------------"

# this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_1(b, n)

  return 1 if n <= 1

  b * exp_1(b, n - 1)
end

p exp_1(0, 0) 

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
