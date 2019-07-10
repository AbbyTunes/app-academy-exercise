def my_min(arr)
    # my_min1(arr) # O(n ^ 2)
    # my_min2(arr) # less than O(n ^ 2)
    # my_min3(arr) # O(n)
    my_min4(arr) # O(n)
end

def my_min1(arr)
    lowest = nil
    arr.each do |num1|
        lowest = num1 if arr.all? { |num2| num1 <= num2 }
    end
    lowest
end

def my_min2(arr)
    arr.each do |num1|
        return num1 if arr.all? { |num2| num1 <= num2 }
    end
end

def my_min3(arr)
    i = 0
    j = 0
    while i < arr.length
        if arr[i] <= arr[j] 
            j = i
        end
        i += 1
    end
    arr[j]
end

def my_min4(arr)
    lowest = arr[0]
    arr.each { |num| lowest = num if num <= lowest }
    lowest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def largest_contiguous_subsum(arr)
    # largest_contiguous_subsum_1(arr) # greater than O(n^2 + 2n) => O(n^2)
    # largest_contiguous_subsum_2(arr) # O(n^2)
    # largest_contiguous_subsum_3(arr)
    largest_contiguous_subsum_4(arr)
end

def largest_contiguous_subsum_1(arr) # O(n^2 + 2n) => O(n^2)
    subs = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subs << arr[i..j]
        end
    end
    subs.map(&:sum).max
end

def largest_contiguous_subsum_2(arr) # O(n^2) 
    largest_sum = 0
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            sub_sum = arr[i..j].sum
            if sub_sum > largest_sum
                largest_sum = sub_sum
            end
        end
    end
    largest_sum
end

# def largest_contiguous_subsum_3(arr) # O(n^2 + n) 
#     start_i = 0
#     end_i = 0
#     greatest_sum = arr[0] #0 # arr[start_i..end_i]
#     while end_i < arr.length  # O(n)

#         if arr[start_i..end_i].sum > greatest_sum # O(n^2)
#             greatest_sum = arr[start_i..end_i].sum
#         end
        
#         if arr[end_i] > arr[start_i..end_i].sum  # O(n^2 + n)
#             start_i = end_i
#             greatest_sum = arr[start_i..end_i].sum
#         end
#         end_i += 1
#     end
#     greatest_sum
# end

#  [2, -6, 3, 7, -6, 7]
#   ij      ij
  
#   [-10, -10, -20, -1 ]
#   [0..2].sum 

def largest_contiguous_subsum_4(arr) # O(n) time with O(1)
    tally = 0
    largest = arr[0]
    (0...arr.length).each do |i|
        tally += arr[i]
        tally = arr[i] if arr[i] > tally
        largest = tally if tally > largest
    end 
    largest
end

# O(n) time with O(1)
[0, 20, -20, 7, ]

# list = [5, 33, -9, 11, 1]
        
# current tally 
# largest sub sum


list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])


list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

# [5, 3, -7]
# [7, -6, 7]
# [-3]