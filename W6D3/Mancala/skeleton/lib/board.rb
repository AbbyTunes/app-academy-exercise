class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { }
    place_stones

    @name1 = name1
    @name2 = name2

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...14).each  { |i|
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    }
  end

  def valid_move?(start_pos)
    if start_pos == 13 || start_pos == 6
      raise "Invalid starting cup"
    elsif start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end

    true
  end

  # def is_player_point_store?(pos, current_player_name)
  #   if ((current_player_name == @name1) && pos == 6) ||
  #      ((current_player_name == @name2) && pos == 13)
  #     return true
  #   end
  #   false
  # end

  def make_move(start_pos, current_player_name)
    if start_pos.between?(1, 6)
      start_pos -= 1
    end

    num = @cups[start_pos].count # 4 steps

    @cups[start_pos] = []

    if current_player_name == @name1
      point_cup = 13
    else
      point_cup = 6
    end

    i = start_pos
    # while i <= i + num
    #   if i == point_cup
    #     num += 1
    #     num = num % 14
    #   end
    #   @cups[i] << :stone
    #   i += 1
    #   i = i % 14

      
    # end

    # i = start_pos
    until num == 0
      i += 1
      i %= 14
      if i != point_cup
        @cups[i] << :stone
        num -= 1
      end
    end

    self.render

    self.next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].empty?
      :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count != 0
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |cup| cup.empty? }
      return true
    elsif @cups[7..12].all? { |cup| cup.empty? }
      return true
    end
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1 
      @name2
    when 0
      :draw
    when 1
      @name1
    end
      
  end
end

test = Board.new("Abby", "Brian")
test.place_stones
test.render