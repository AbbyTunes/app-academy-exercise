def partition(arr, n)
    arr1 = []
    arr2 = []
    
    arr.each do |ele|
        if ele < n
            arr1 << ele
        else
            arr2 << ele
        end
    end
    [arr1, arr2]
end

def merge(hash_1, hash_2)
    merged = hash_1.dup
    hash_2.each { |k, v| merged[k] = v }
    merged
end

def censor(sentence, curse_words)
    vowels = "aeiouAEIOU"
    new_sentence = []
    sentence.split.each do |word|
        if curse_words.include?(word.downcase)
            word.each_char.with_index do |char, i|
                word[i] = "*" if vowels.include?(char)
            end
        end
        new_sentence << word
    end
    new_sentence.join(" ")
end

def power_of_two?(num)
    i = 1
    while i <= num
        return true if i == num
        i *= 2
    end
    false
end