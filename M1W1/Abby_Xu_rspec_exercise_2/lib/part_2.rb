def palindrome?(str)
    str.each_char.with_index do |char, i|
        return false if str[i] != str[-i-1]
    end
    true
end

def substrings(str)
    sub_str = []
    (0...str.length).each do |start_i|
        (start_i...str.length).each do |end_i|
            sub_str << str[start_i..end_i]
        end
    end
    sub_str
end

def palindrome_substrings(str)
    substrings(str).select { |ele| ele.length > 1 && palindrome?(ele) }
end