
class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        prc ||= Proc.new { |i| selected << self[i] }

        self.my_each do |i|
            if prc.call(i) == true
                selected << i
            end
        end
       selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |i|
            if prc.call(i) == false
                rejected << i
            end
        end
        rejected
    end

    def my_any?(&prc)
        return self if prc.nil? 
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        return self if prc.nil?
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        return true
    end

    def my_flatten
        new_arr = []
        self.my_each do |n|
            if n.is_a?(Array)
                new_arr.concat(n.my_flatten)
            else
                new_arr << n
            end
        end
        new_arr
    end

    def my_zip(*arrays)
        new_arr = []
        self.length.times do |i|
            subzip = [self[i]]
            arrays.my_each do |array|
                subzip << array[i]
            end
            new_arr << subzip
        end
        new_arr
    end
    
    def my_rotate(num = 1)
        n = self.length
        new_arr = []
        if n > 0 
            n.times do |i|
                new_idx = (i + num) % self.length
                new_arr << self[new_idx]
            end
        elsif n < 0
            n.abs.times do |i|
                new_idx = (i - num) % self.length
                new_arr << self[new_idx]
            end
        end
        new_arr
    end

    def my_join(str = "")
        new_str = ""
        self.my_each do |ele|
            new_str += (ele + str)
        end
        if str != ""
            new_str.slice(0, new_str.length - 1)
        else
            new_str
        end
    end
    
    def my_reverse
        reversed = []
        i = -1
        self.my_each do |ele|
            reversed << self[i]
            i -= 1
        end
        reversed
    end

     def bubble_sort!(&prc)
        prc ||= Proc.new {|x, y| x <=> y}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).map do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i + 1] = self[i + 1], self[i]
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end
    
end

def factors(num)
    (1..num).select {|factor| num % factor == 0}

end

def substrings(string)
    subs = []
    (0...string.length).each do |start_i|
        (start_i..string.length).each do |end_i| 
            subs << string[start_i..end_i]
        end
    end
    subs
end

def subwords(word, dictionary)
    words = []
    substring = substrings(word)
    substring.select do |sub|
        words << sub if dictionary.include?(sub)
    end
    words.uniq
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end
p return_value  # => [1, 2, 3]

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]