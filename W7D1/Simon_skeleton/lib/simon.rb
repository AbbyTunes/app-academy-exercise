class Simon

  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "\n\nStart!\n\n"
    self.take_turn until @game_over # == true
    self.game_over_message
    sleep(1.2)
    self.reset_game
  end

  def take_turn
    unless @game_over # == true
      sleep(0.5)
      system("clear")
      self.show_sequence
      puts "you get to level #{@sequence_length}"
      @sequence_length += 1
      self.require_sequence
    end
  end

  def show_sequence
    self.add_random_color
    print @seq.last
    sleep(0.6)
    system("clear")
  end

  def require_sequence
    i = 0
    while i < @seq.length 
      puts "\n\nenter the ##{i + 1} color:\n" # not @sequence_length
      input = gets.chomp
        if input == @seq[i]
          self.round_success_message
        else
          return @game_over = true
        end
      i += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
      puts "-- you got it right\n"
  end

  def game_over_message
    puts "\n\n\n** GAME OVER **\n"

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

end

if $PROGRAM_NAME == __FILE__
  test = Simon.new
  test.play
end