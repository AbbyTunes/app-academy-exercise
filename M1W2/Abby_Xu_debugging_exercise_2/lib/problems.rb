def largest_prime_factor(num)
    i = num
    while i > 0
        return i if num % i == 0 && is_prime?(i)
        i -= 1
    end
end

def is_prime?(num)
    false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def unique_chars?(str)
    counted = []
    str.each_char do |char|
        return false if counted.include?(char)
        counted << char
    end
    true
end

def dupe_indices(arr)
    indices = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index { |key, i| indices[key] << i }
    indices.select { |k, v| v.size > 1 }
end

def ana_array(arr1, arr2)
    counter(arr1) == counter(arr2)
end

def counter(arr)
    counter = Hash.new(0)
    arr.each { |key| counter[key] += 1 }
    counter
end
