#Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. 
#For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
#Write both a recursive and iterative version of sum of an array.

def range(start_num, end_num)
    # range1(start_num, end_num)
    range2(start_num, end_num)
end

def range1(start_num, end_num)

    return [] if start_num >= end_num
    return [start_num] if start_num + 1 == end_num 

    previous_arr = range(start_num, end_num - 1)
    previous_arr << previous_arr[-1] + 1

end

def range2(start_num, end_num)

  return [] if start_num == end_num
  range2(start_num, end_num -1) << end_num - 1
  
end

p range(2,5)
p range(2,7)
p range(1,5)
p range(-3,9)

def sum_recursive(array)
    return 0 if array.empty?
    array[0] + sum_recursive(array[1..-1])
end

def sum_iterative(array)
    array.inject(:+)
end
array1=[1,2,3,4]
array2=[2,4,6,8]
array3=[3,6,6,9]
array4=[2,3,6,-5]

p sum_recursive(array1)
p sum_recursive(array1) == array1.sum
p sum_recursive(array2)
p sum_recursive(array3)
p sum_recursive(array4)
puts
p sum_iterative(array1)
p sum_iterative(array1) == array1.sum
p sum_iterative(array2)
p sum_iterative(array3)
p sum_iterative(array4)

#Exponentiation
#Write two versions of exponent that use two different recursions:

def exp(b, n)
    # exp1(b, n)
     exp2(b, n)
end

def exp1(b, n)
    n == 0 ? 1 : b * exp(b, n - 1)
end

def exp2(b, n)
    return 1 if n == 0
    if n.even?
        exp2(b, (n / 2)) ** 2  
    else  #n.odd?
        exp2(b, (n / 2)) ** 2 * b
    end
end

p exp(2, 0) #= 1
p exp(2, 1) #= 2
p exp(2, 5) #=32
p exp(4, 3) #=64

class Array 
    def deep_dup
        map {|el| el.is_a?(Array) ? el.deep_dup : el}
    end
end

robot_parts = [
   [["nuts"], "bolts", "washers"],
   ["capacitors", "resistors", "inductors"]
    ]
nums = [1, [2], [3, [4]]]
p nums.deep_dup
p a = nums[-1][-1].object_id
p b = nums.deep_dup[-1][-1].object_id
p a == b

puts "++"
    
p robot_parts.deep_dup
p a = robot_parts[0][0].object_id
p b = robot_parts.deep_dup[0][0].object_id
p a == b
puts

def fib_rec(num)
  return [] if num <= 0
  return [0] if num == 1
  return [0, 1] if num == 2

  fib_array = fib_rec(num - 1)
  fib_array << fib_array[-1] + fib_array[-2]
end

# iterative
def fib(num)
  return [] if num <= 0
  return [0] if num == 1

  results = [0, 1]

  until results.length == num
    results << results[-1] + results[-2]
  end
  results

end

p fib_rec(6)
p fib_rec(3)
p fib_rec(2)
p fib_rec(1)
puts

p fib(6)
p fib(3)
p fib(2)
p fib(1)

# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

#class Array

def bsearch(array, value)

    return nil if array.empty?
    
    mid = array.length / 2
    case value <=> array[mid]
    when 0
        return mid
    when -1
        left = array.take(mid)
        bsearch(left, value)
    when 1
        right = array[mid+1..-1]
        bsearch_right = bsearch(right, value)
        bsearch_right.nil? ? nil : (bsearch_right + mid + 1)
        # bsearch_right + mid + 1
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


class Array  
    def merge_sort
       return self if self.length <= 1
       mid = self.length / 2
      
       left, right = self.take(mid), self.drop(mid)
       merge(left.merge_sort, right.merge_sort)
    end

    def merge(left, right)
        sorted=[]
        until (left.empty? || right.empty?)
          sorted << (left.first < right.first ? left.shift : right.shift)
        end

        sorted + left + right
    end
end

arr1 = [1, 2, 3, 4, 5].shuffle
arr2 = [1, 2, 6, 9, 300].shuffle
arr3 = [-10, -02, 6, 90, 300].shuffle

p arr1.merge_sort
p arr2.merge_sort
p arr3.merge_sort

def subsets2(array)
  return [[]] if array.empty?
  small_subs = subsets2(array.take(array.length - 1))
  supersize = small_subs.map { |sub| sub + [array.last] }
  small_subs + supersize
end

puts
p subsets2([]) # => [[]]
p subsets2([1]) # => [[], [1]]
p subsets2([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets2([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
                        
# def permutation(array)
#     array
# end
# p permutation([1,2,3])


def make_change(amount, coins)
    
  return 0 if (coins.empty? || amount == 0)

  wonky_coins = coins
  sum = amount / wonky_coins[0]
  remainder = amount % wonky_coins[0]
  wonky_coins.shift

  total_change = sum + make_change(remainder, wonky_coins)

end

p make_change(24, [10,7,1])
p make_change(29, [25, 10, 5, 1])