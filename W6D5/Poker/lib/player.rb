require_relative 'hand.rb'

class Player
  attr_reader :bankroll, :hand, :current_bet # :deck
  # need to have variable getter

  attr_accessor :folded

  # include Comparable

  def self.buy_in(bankroll)
    Player.new(bankroll)
  end

  def initialize(bankroll)
    @bankroll = bankroll
    # @hand = Hand.new # call in Deck class
    @current_bet = 0
    @folded = false
  end

  def deal_in(hand)
    @hand = hand
  end

  def take_bet(new_bet)
    # WRONG
    # current_bet = @last_bet == 0 ? new_bet : new_bet - @last_bet
    # this if else statement essentially works the same
    # current_bet = new_bet - @last_bet

    raised_money = new_bet - @current_bet
    raise 'not enough money' if raised_money > @bankroll
    @bankroll -= raised_money
        
    @current_bet = new_bet # @current_bet += raised_money
  end

  # def bet_money #amt
  #     amt = gets.chomp.to_i # given an argument as input
  #     if amt > @bankroll
  #         puts "you don't have enough money" # use rspec
  #         self.bet_money # don't call yourself again here
  #     end
  # end

  def receive_winnings(amount)
    @bankroll += amount
  end

  def return_cards
    returning_cards = @hand.cards # store the cards to a variable
    @hand = nil
    returning_cards # return this result to this method
  end

  def fold
    @folded = true
  end

  def unfold
    @folded = false
  end

  def folded?
    @folded
  end

  # def respond_bet
  # end

  # def get_bet
  # end

  # def get_cards_to_trade

  # def reset_current_bet
  # end

  # def <=>(other_player)
  #   # hand <=> other_player.hand
  # end
end
