class Code

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars)
    chars.all? { |char| Code::POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_arr = []
    length.times { random_arr << Code::POSSIBLE_PEGS.keys.sample }
    Code.new(random_arr)
  end

  def self.from_string(str)
    Code.new(str.upcase.split(""))
  end

  attr_reader :pegs

  def initialize(chars)
    raise "it has unvalid pegs" if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...@pegs.length).count { |i| @pegs[i] == guess[i] }
  end

  def num_near_matches(guess)
    (0...@pegs.length).count { |i| @pegs.include?(guess[i]) && @pegs[i] != guess[i] }
  end

  def ==(code_instance)
    return false if code_instance.length != self.length
    self.num_exact_matches(code_instance) == self.length
  end

end
