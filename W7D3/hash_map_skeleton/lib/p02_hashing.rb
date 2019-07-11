class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_arr = []
    self.each_with_index do |ele, i|
        new_arr << (ele * i).hash
    end
    new_arr.sum.hash
  end
end


class String
  def hash
    int = 0
    new_arr = []
    alphabet = ("a".."z").to_a
    self.each_char.with_index do |char, i|
      # int += i.hash * i
      if alphabet.include?(char)
        int = alphabet.index(char)
      end
      new_arr << ( (i + 1) * (int + 1) ).hash
    end
    new_arr.hash
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    int = 0
    self.each do |k, v|
      int += v.hash
    end
    int
  end
end
