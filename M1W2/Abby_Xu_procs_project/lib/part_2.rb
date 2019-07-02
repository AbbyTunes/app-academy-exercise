def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    sentence.split(" ").map { |word| prc.call(word) }.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)

    case prc_1.call(num) <=> prc_2.call(num)
    when 1
        return prc_1.call(num)
    when -1
        return prc_2.call(num)
    end
end

def and_selector(arr, prc_1, prc_2)
    selected = []
    arr.each { |ele| selected << ele if prc_1.call(ele) && prc_2.call(ele) }
    selected
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i.even?
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end