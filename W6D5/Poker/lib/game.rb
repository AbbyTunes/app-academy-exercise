require_relative './player'
require_relative './deck'

class Game

  attr_reader :pot, :deck, :players
  
  def initialize
    @pot = 0
    @deck = Deck.new() # don't have to pass in cards
    # @deck = Deck.all_cards # not what rspec asked for
    @players = []
    # @current_player = current_player
  end

  def add_players(n, buy_in)
    # if buy_in is a total number
    # each_bankroll = buy_in / 3.0
    # n.times do 
    #   @players << Player.new(each_bankroll)
    # end

    # if buy_in is an array
    # i = 0
    # while i < n
    #   @players << Player.new(buy_in[i])
    #   i += 1
    # end

    # if buy_in is a number for each player
    while n > 0
      @players << Player.new(buy_in)
      n -= 1
    end
    # @players # optional
  end

  def current_player
    # @current_player = @players == [] ? nil : @players.first
    @players.first
  end

  def game_over?
    @players.one? { |player| player.bankroll > 0 }
    # check only one player has money left
  end

  def deal_cards
    @players.each do |player|
      next if player.bankroll <= 0
      hand = @deck.take(5)
      player.deal_in(hand)
    end
  end

  def add_to_pot(amount)
    @pot += amount
    amount
  end


#   def play
#     one_round until game_over?
#     # end_game
#   end

#   def play_round
#   end

#   def reset_players
#   end

#   def take_bets
#   end

#   def display_status(index, high_bet)
#   end

#   def trade_cards
#   end

#   def end_round
#   end

#   def return_cards
#   end

#   def winner
#   end

#   def show_hands
#   end

#   def round_over?
#   end

#   def end_game
#     puts "The game is over"
#   end

end

if $PROGRAM_NAME == __FILE__
  test = Game.new
  test.add_players(3, 100)
end
