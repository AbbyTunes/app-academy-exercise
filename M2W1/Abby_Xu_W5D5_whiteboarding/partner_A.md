## Partner A: White Boarding

## Merge and Sorts

### Merge Sort

Write a new `Array#merge_sort` method that takes in a proc; it should not modify the array it is called on, but create a new sorted array.

### Solution

```rb
class Array
  def merge_sort(&prc)
    return self if count <= 1

    # I create a Proc if no block was given; this eliminates having to
    # later have two branches of logic, one for a block and one for no
    # block.

    # prc ||= proc { |x, y| x <=> y }
    prc ||= Proc.new { |x, y| x <=> y }

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc) 
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    self.class.merge(sorted_left, sorted_right, prc)
  end

  private
  def self.merge(left, right, &prc) 

    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left).concat(right)
  end
end
```

## Monkey Patching

### my_flatten

Write a method that flattens an array to the specified level. If no level
is specified, it should entirely flatten nested arrays.

Examples:

```ruby
# Without an argument:
[["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

# When given 1 as an argument:
# (Flattens the first level of nested arrays but no deeper)
[["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]
```

### Solution

```rb
class Array
  def my_flatten(level = nil)
    duped = self.dup # [1,[2,3], [4,[5]]]
    return duped if level == 0
    next_level = level ? level - 1 : nil # 0

    each_with_index do |el, i| # el = [2,3], i = 1
      duped[i..i] = el.my_flatten(next_level) if el.is_a?(Array)
    end

    duped  [1, [2, 3]]
  end
end

# el.my_flatten(next_level) # duped = [2, 3] # i = 1, ele = 2 
class Array
def flatten_2(level)
    return self if level == 0

    arr = [] 
    self.each { |el| arr += el.is_a?(Array) ? el.flatten_2(level - 1) : [el] }
    arr 
  end
end

```

```rb
# [1,[2,3], [4,[5]]] -> [1,2,3,4,[5]]
#my_flatten("a") ["a"]


duped = self.dup
return duped if level == 0
if next_level = level
  level - 1 
else
  nil
end


[1,[2,3], [4,[5]]].each_with_index do |ele, i|
  if ele.is_a?(Array)
    duped[i] = ele.my_flatten(level - 1)
  else
    ele / next
  end
C




```

### my_reduce

Write an array method that calls the given block on each element and
combines each result one-by-one with a given accumulator. If no accumulator is given, the first element is used.

### Solution

```rb
class Array
  def my_reduce(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end
```

### Shuffled Sentences

This method returns true if the words in the string can be rearranged to form the
sentence passed as an argument. Words are separated by spaces.

Example:

```ruby
"cats are cool".shuffled_sentence_detector("dogs are cool") => false
"cool cats are".shuffled_sentence_detector("cats are cool") => true
```

### Solution

```rb
class String
  def shuffled_sentence_detector(other)
    self.split.sort == other.split.sort
  end
end
```

## Recursion

### Fibonacci

Write a method that finds the first `n` Fibonacci numbers recursively.

### Solution

```rb
def fibs_rec(count)
  return [0, 1].take(count) if count <= 2

  first_fibs = fibs_rec(count - 1)
  next_fib = first_fibs[-1] + first_fibs[-2]
  first_fibs << next_fib

  first_fibs
end
```
