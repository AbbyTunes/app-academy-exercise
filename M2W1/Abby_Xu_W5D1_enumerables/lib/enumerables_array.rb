
def factors(num)
    # return [1, num] if is_prime?(num)
    fact = []
    (1..num).each do |i|
        fact << i if num % i == 0
    end
    fact
end

def subwords(str, words)
    sub_str = []
    (0...str.length).each do |start_i|
        (start_i...str.length).each do |end_i|
            sub_str << str[start_i..end_i]
        end
    end
    sub_str.select { |word| words.include?(word) }.uniq
end

def doubler(arr)
    arr.map { |el| el * 2 }
end

class Array

    def bubble_sort!(&prc)
        return self if self.size <= 1
        prc ||= Proc.new { |x, y| x <=> y }
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_map(&prc)
        mapping = []
        # i = 0
        # while i < self.length
        #     mapping << prc.call(self[i])
        #     i += 1
        # end
        self.my_each { |el| mapping << prc.call(el) }
        mapping
    end

    def my_select(&prc)
        selected = []
        # i = 0
        # while i < self.length
        #     selected << self[i] if prc.call(self[i])  
        #     i += 1
        # end
        self.my_each { |el| selected << el if prc.call(el) }
        # shovel the element / self[i] into the array, not the index i
        selected
    end

  def my_inject(acc = nil, &prc)
    arr = self #arr can be drop(1), also can be self
    if acc == nil  # it it an optional branch
      acc = self[0]
      arr = self.drop(1) # change array to arr[1..-1], optional here
    end
    
    # else  # CAN NOT Use else, NOT a branch
    
    arr.each do |el|   # CAN NOT Use |acc, el| <= acc is passed on from above 
      acc = prc.call(acc, el)  # actually changed accumulator
    end
    acc
  end

end

def concatenate(strings)
    strings.inject do |acc, el|
        acc + el  # sum up all the element, turn array into a string
    end
end