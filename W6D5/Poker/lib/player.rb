class Player
  attr_reader :bankroll, :hand, :current_bet

  include Comparable

  def self.buy_in(bankroll)

  end

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    # @hand = Hand.new # call in Deck class
  end

  def deal_in(hand)
    @hand = hand
  end

  def bet_money #amt
      amt = gets.chomp.to_i
      if amt > @bankroll
          puts "you don't have enough money"
          self.bet_money
      end
  end

  def raise_bet
      @bankroll -= self.bet_money
  end

  # def respond_bet

  # end

  # def get_bet

  # end

  # def get_cards_to_trade


  # def take_bet(total_bet)

  # end

  # def reset_current_bet

  # end

  # def receive_winnings(amount)

  # end

  # def return_cards

  # end

  # def fold
  #   folded = true
  # end

  # def unfold
  #   folded = false
  # end

  # def folded?
  #   # if fold == true
  # end

  # def trade_cards(old_cards, new_cards)

  # end

  # def <=>(other_player)
  #   # hand <=> other_player.hand
  # end

end
