require_relative './player'
require_relative './deck'

class Game

  attr_reader :pot, :deck, :players
  def initialize
    @pot = 0
    @deck = Deck.new() # don't pass in cards
    @players = []
    # @current_player = 
  end

  def add_players(n, buy_in)

  end




  def play
    one_round until game_over?
    # end_game
  end

  def play_round

  end

  def reset_players

  end

  def deal_cards

  end

  def take_bets
   
  end

  def display_status(index, high_bet)
   
  end

  def trade_cards
    
  end

  def end_round
    
  end

  def return_cards
   
  end

  def winner
   
  end

  def show_hands

  end

  def add_to_pot(amount)

  end

  def round_over?

  end

  def game_over?

  end

  def end_game
    puts "The game is over"
  end
end

if __FILE__ == $PROGRAM_NAME
  test = Game.new
  test.add_players(5, 100)
  test.play
end


# class Game

#   attr_reader :players, :pot, :deck

#   def initialize(players, deck, pot)

#       @player1 = Player.new("1", 100)
#       @player2 = Player.new("2", 200)
#       @player3 = Player.new("3", 300)
#       @player4 = Player.new("4", 400)

#       @players = [@player1, @player2, @player3, @player4]
#       @current_player = @players.first
#       @current_bet = 
#       @deck = Deck.new(cards)
#       @pot = 0
#   end

#   def run
#       self.one_round until self.over?
#   end

#   def one_round
#       @current_player.prompt # get bets from current player
#       @players.push(@players.shift)
#       @player.first
#   end

#   def over?
#       win?
#   end
  
#   def win?
#       # compare hands, find winner
#   end 
  
#   def winner
#       # winner gets the pot
#   end