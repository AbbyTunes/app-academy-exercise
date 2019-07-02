
def no_dupes?(arr)
    counter = Hash.new(0)
    arr.each { |key| counter[key] += 1 }
    counter.select { |k, v| v == 1 }.keys
end


p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.size-1).none? { |i| arr[i] == arr[i+1] }
end


p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    counter = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, i| counter[char] << i }
    counter
end


p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest_str = str[0]
    streak = ""
    (0...str.length).each do |i|
        streak += str[i]
        if str[i] != str[i + 1]
            longest_str = streak if streak.length >= longest_str.length
            streak = ""
        end
    end
    longest_str
end


p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    (2...num).any? do |i|
        if num % i == 0 
            is_prime?(i) && is_prime?(num / i)
        end
    end
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end


p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    new_message = ""
    (0...message.length).each do |i|
        old_i = alphabet.index(message[i]) # find index in alphabet
        step = keys[i % keys.length] # both are index, mod keys_i, find step (new index)
        new_i = (old_i + step) % alphabet.length # both are index, mod alpha_i, find new_alpha_i
        new_char = alphabet[new_i]
        new_message += new_char
    end
    new_message
end

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = "aeiou"
    vow = str.split("").select { |char| vowels.include?(char) }
    new_vow = vow.unshift(vow.pop)

    new_str = ""
    i = 0
    str.each_char do |char|
        if !vowels.include?(char)
            new_str += char
        else
            new_str += new_vow[i]
            i += 1
        end
    end
    new_str
end 


p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        prc ||= Proc.new { |char| false }
        new_str = ""
        self.each_char { |char| new_str += char if prc.call(char) }
        new_str
    end

    def map!(&prc)
        (0...self.length).each { |i| self[i] = prc.call(self[i], *i) }
        self
    end

end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


def multiply(a, b)
    if b >= 0
        return 0 if b == 0
        a + multiply(a, b - 1)
    else
        return -a if b == -1
        - a + multiply(a, b + 1)
    end
end


p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18


def lucas_sequence(n)
    return [2, 1][0...n] if n <= 2
    prev_seq = lucas_sequence(n-1)
    prev_seq << prev_seq[-1] + prev_seq[-2]
end


p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    return [num] if is_prime?(num)
    (2..num).each do |i|
        if num % i == 0
            if is_prime?(i)
                return [i] + prime_factorization(num / i)
            end
        end
    end
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
