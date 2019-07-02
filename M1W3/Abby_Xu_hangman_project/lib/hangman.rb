class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |c, i| indices << i if c == char }
    indices
  end

  def fill_indices(char, arr)
    arr.each { |i| @guess_word[i] = char }
    @guess_word
  end

  def try_guess(char)

    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    end

    @attempted_chars << char

    indices = self.get_matching_indices(char)
    if indices.empty?
      @remaining_incorrect_guesses -= 1
    end

    self.fill_indices(char, indices)
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      print @secret_word
      return true
    end
    false
  end


end
