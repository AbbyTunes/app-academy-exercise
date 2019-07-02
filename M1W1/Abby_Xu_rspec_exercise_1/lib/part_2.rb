def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        return word[0...i] + word[i+1..-1] if vowels.include?(word[i])
        i -= 1
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)
    str.downcase.each_char do |char|
        count[char] += 1 if vowels.include?(char)
    end
    count
end

def caesar_cipher(message, n)
    alphabet = ("a".."z").to_a
    str = ""
    message.each_char do |char|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = (old_idx + n) % 26
            str += alphabet[new_idx]
        else
            str += char
        end
    end
    str
end