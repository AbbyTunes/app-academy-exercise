def two_sum?(arr, target)
    # very_bad_two_sum?(arr, target)
    # bad_two_sum?(arr, target)
    okay_two_sum?(arr, target)

end


def very_bad_two_sum?(arr, target)
    pairs = []
    (0...arr.length).each do |i| 
        (i+1...arr.length).each do |j| 
            pairs << [i, j] if arr[i] + arr[j] == target
        end
    end
    !pairs.empty?
end

def bad_two_sum?(arr, target)
    (0...arr.length).each do |i| 
        (i+1...arr.length).each do |j| 
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

def okay_two_sum?(arr, target)
    arr.sort.each do |num|
        return true if bsearch(arr, target-num)
    end
end

# def bsearch(arr, target)
#     return nil if arr.length <= 1 && arr[0] != target

#     mid = arr.length/2

#     left = arr.take(mid)
#     right = arr.drop(mid)
#     case target <=> arr[mid]
#     when -1
#         bsearch(left, target)
#     when 0
#         return mid
#     when 1
#         return nil if bsearch(right[1..-1], target).nil?
#         mid + bsearch(right[1..-1], target)
#     end
# end

# (0...arr.length).bsearch {|i| i } + (0...arr.length).bsearch {|j| j } == target
    

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false