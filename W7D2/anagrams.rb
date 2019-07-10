def anagram?(str1, str2)

    # anagram_1_interative(str1, str2)

    anagram_2_interative_abby(str1, str2)
    # anagram_2_interative_tom(str1, str2)
    # anagram_2_recursive(str1, str2)

    # anagram_3_alphabetically(str1, str2)
    
    # anagram_4_hash_abby(str1, str2)
    # anagram_4_hash_tom(str1, str2)
end

def anagram_1_interative(str1, str2) # O(n * n * n * n * n) => O(n^5) => O(n^n)

    # n.times do |i|  # O(n!) => 
    #     n.times do |j|
    #     (0...str1.length).each do |i|
    # end

    anas = []    
    (0...str1.length).each do |i|
        (0...str1.length).each do |j|
            (0...str1.length).each do |k|
                (0...str1.length).each do |l|
                    (0...str1.length).each do |m|
                        if [i, j, k, l, m].uniq == [i, j, k, l, m]
                            str3 = str1[i] + str1[j] + str1[k] + str1[l] + str1[m]
                            anas << str3
                        end
                    end
                end
            end
        end
    end
    anas.include?(str2)
end

def anagram_2_interative_abby(str1, str2)
    return false unless str1.length == str2.length 
    arr2 = str2.split("")
    str1.each_char do |char|
        if arr2.include?(char)
            i = arr2.find_index(char)
            arr2.delete_at(i)
        end
    end
    arr2 == []
end

def anagram_2_interative_tom(str1, str2) # O(4n + 4) => O(n)
    return false if str1.length != str2.length # only n, constance
    arr1 = str1.split("")
    arr2 = str2.split("")

    arr1.each do |char| # n ^ n
        arr2.delete_at(arr2.index(char)) if arr2.index(char)
    end
    arr2.empty?       
end


def anagram_2_recursive(str1, str2) # O()
    arr2 = str2.split("")
    anagram_3_helper(str1, arr2)
end

def anagram_3_helper(str1, arr2) # O(2n ^ n)  # str.length is n
    if str1.length == 0
        return true if arr2.length == 0
        return false if arr2.length != 0
    end
    if arr2.include?(str1[0])  # n
        arr2.delete(str1[0]) # n
    end # 2n => n
    anagram_3_helper(str1[1..-1], arr2) # n * 2n => O(n ^ 2)
end

# Write a method third_anagram? 
# that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams 
# if and only if the sorted versions are the identical.

def anagram_3_alphabetically(str1, str2) # O( 2*(nlogn) ) => O(nlogn)
    str1.split("").sort == str2.split("").sort
    # what kind of sorting method
end

   
def anagram_4_hash_abby(str1, str2) # O(2n) => O(n)
    calculate_char(str1) == calculate_char(str2)
end

# def anagram_4_hash_tom(str1, str2) # O(4n) => O(n)
#     hash = calculate_char(str1) # n
#     str2.each_char { |char| hash[char] -= 1 } # n
#     hash.values.sum == 0 # 2n
# end

def calculate_char(str)
    counter = Hash.new(0)
    str.each_char { |char| counter[char] += 1 }
    counter
end


p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true

# def test(str1, str2)
#     x = 0 
#     anas = []
#     str1.length.times do
#         x + 1
#         placeholder = "x"
#         (0...str.length).each do |placeholder|
#         end
#     end
# end