# Exercise 1 - sum_to
#
# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).
#
#   # Test Cases


def sum_to(n)
  return 0 if n == 0
  return nil if n < 0

  n + sum_to(n - 1)
end
# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

# Exercise 2 - add_numbers
#
# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers. Write this method
# recursively.
  def add_numbers(arr)
    return nil if arr.empty?

    if arr.length == 1
      return arr.first
    end
    arr.last + add_numbers(arr[0...arr.length-1])

  end
  # Test Cases
  # puts add_numbers([1,2,3,4]) # => returns 10
  # puts add_numbers([3]) # => returns 3
  # puts add_numbers([-80,34,7]) # => returns -39
  # puts add_numbers([]) # => returns nil


#   Exercise 3 - Gamma Function
#
# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.
#
  def gamma_fnc(n)
    return nil if n == 0

    return 1 if n == 1

    (n - 1) * gamma_fnc(n - 1)
  end
#   # Test Cases
  # puts gamma_fnc(0)  # => returns nil
  # puts gamma_fnc(1)  # => returns 1
  # puts gamma_fnc(4)  # => returns 6
  # puts gamma_fnc(8)  # => returns 5040


# Exercise 4 - Ice Cream Shop
#
# Write a function ice_cream_shop(flavors, favorite) that takes in
# an array of ice cream flavors available at the ice cream shop,
# as well as the user's favorite ice cream flavor. Recursively find
# out whether or not the shop offers their favorite flavor.

  def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?

    if flavors.length == 1
      return false unless flavors.last == favorite
    end

    return true if flavors.last == favorite

    ice_cream_shop(flavors[0...flavors.length-1], favorite)
  end
  # # # Test Cases
  # puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  # puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  # puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  # puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  # puts ice_cream_shop([], 'honey lavender')  # => returns false

#   Exercise 5 - Reverse
#
# Write a function reverse(string) that takes in a string and returns
# it reversed.
  def reverse(string)
    string = string.split("")
    return "" if string.empty?

    if string.length == 1
      return string.join("")
    end

    string.last.to_s + reverse(string[0...string.length - 1].join(""))
  end
  # Test Cases
  # puts reverse("house") # => "esuoh"
  # puts reverse("dog") # => "god"
  # puts reverse("atom") # => "mota"
  # puts reverse("q") # => "q"
  # puts reverse("id") # => "di"
  # puts reverse("") # => ""
