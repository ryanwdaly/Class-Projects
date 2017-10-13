# # My Each
# #
# # #Extend the Array class to include a method named my_each that takes a
# # block, calls the block on every element of the array, and returns the
# # original array. Do not use Enumerable's each #method.
# # I want to be able to write:
#
# puts "enumerable.rb"
class Array
  def my_each(&prc)
    (self.size).times do |i|
      prc.call(self[i])
    end
    self
  end


end
#
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
#
puts "----------------------------"
puts "my_select:"
# # My Select
# #
# # Now extend the Array class to include my_select that
# # takes a block and returns a new array containing only elements
# # that satisfy the block.
# # Use your my_each method!
class Array
  def my_select(&prc)
    result = []

    self.my_each do |num|

      if prc.call(num)
        result << num
      end
    end
    result
  end
end
#
#
#
a = [1, 2, 3]
puts a.my_select { |num| num > 1 } # => [2, 3]
puts a.my_select { |num| num == 4 } # => []
puts "-------------------------"
puts "my_any?: "
# # My Any
# # Write my_any? to return true if any elements of the array satisfy the
# # block and my_all? to return true only if all elements satisfy the
# # block.
class Array
  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end
    false
  end
end
#
a = [1, 2, 3]
puts "any:"
puts a.my_any? { |num| num > 1 }
puts a.my_any? { |num| num == 4 }
puts "all:"
puts a.my_all? { |num| num > 1 }
puts a.my_all? { |num| num < 4 }
puts "________________________________"
# puts "my reject:"
#
# # My Reject
# #
# # Write my_reject to take a block and return a new array excluding
# # elements that satisfy the block.
# #
# # Example:
# class Array
#   def my_reject(&prc)
#     result = []
#
#     self.my_each do |num|
#       result << num unless prc.call(num)
#     end
#       result
#   end
# end
#
# a = [1, 2, 3]
# puts a.my_reject { |num| num > 1 } # => [1]
# puts a.my_reject { |num| num == 4 } # => [1, 2, 3]
# puts "________________________________"
# puts "my flatten:"
# # My Flatten
# #
# # my_flatten should return all elements of the array into a new,
# # one-dimensional array. Hint: use recursion!
#
# class Array
#   def my_flatten
#     arr = self
#     result = []
#
#     arr.my_each do |el|
#       if el.is_a? Integer
#         result << el
#       else
#
#         result += el.my_flatten
#       end
#
#     end
#     result
#   end
# end
#
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
# # => [1, 2, 3, 4, 5, 6, 7, 8]
# puts "---------------------------------"
# puts "rotate: "
#
# # My Rotate
# #
# # Write a method my_rotate that returns self rotated. By default, the
# # array should rotate by one element. If a negative value is given,
# # the array is rotated in the opposite direction.
#
# class Array
#   def my_rotate(rotate = 1)
#     result = []
#
#     (0...self.length).each do |i|
#       new_pos = i - rotate
#       if new_pos >= 0
#         new_pos = (new_pos) % self.length
#       else
#         new_pos = new_pos % self.length
#         # new_pos += self.length
#       end
#
#
#         result[new_pos] = self[i]
#     end
#     result
#   end
# end
#
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# puts a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# a.my_rotate(5)
# puts "---------------------------------"
# puts "my zip:"
# # My Zip
# #
# # Write my_zip to take any number of arguments. It should return a new
# # array containing self.length elements. Each element of the new array
# #  should be an array with a length of the input arguments + 1 and
# #  contain the merged elements at that index. If the size of any
# #   argument is less than self, nil is returned for that location.
# #
# # Example:
# #
# # a = [ 4, 5, 6 ]
# # b = [ 7, 8, 9 ]
# # [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# # a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# # [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# #
# # c = [10, 11, 12]
# # d = [13, 14, 15]
# # [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
#
# class Array
#   def my_zip(*args)
#     array = [self]
#     array += args
#     result = []
#     (0...self.length).each do |i|
#       row = []
#       (0...self.length).each do |j|
#         row << array[j][i]
#       end
#       result << row
#     end
#     result
#   end
# end
#
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b)# => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# puts "------------------------"
# # My Join
# #
# # my_join returns a single string containing all the elements of the
# # array, separated by the given string separator. If no separator is
# # given, an empty string is used.
# class Array
#   def my_join(separator = "")
#     result = ""
#
#     i = 0
#     while i < self.length
#       result << self[i]
#       result << separator if i != self.length - 1
#       i += 1
#     end
#     result
#   end
# end
# # Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
# puts "-------------------------------"
# puts "my_reverse:"
# # My Reverse
# #
# # Write a method that returns a new array containing all the elements of the original array in reverse order.
# #
# # Example:
# class Array
#   def my_reverse
#     result = []
#     i = self.length - 1
#
#     while i >= 0
#       result << self[i]
#       i -= 1
#     end
#     result
#   end
# end
#
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
