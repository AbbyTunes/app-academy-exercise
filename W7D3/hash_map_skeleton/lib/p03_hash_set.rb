class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    self[key.hash] << key && @count += 1 if !self.include?(key)
    if count == num_buckets
      resize!
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    @num_buckets *= 2
    old_store = @store
    @store = Array.new(@num_buckets) { Array.new }
    old_store.flatten.each do |ele|
      @store.insert(ele)
    end
  end
end
