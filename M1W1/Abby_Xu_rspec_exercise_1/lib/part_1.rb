def average(num_1, num_2)
    avg = (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum * 1.0 / arr.size
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split.map.with_index do |word, i|
        if i.even?
            word.upcase
        else
            word.downcase
        end
    end
    words.join(" ")
end