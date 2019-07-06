require_relative './poker_hands'

class Hand

  def initialize
      @cards = cards
  end

  card.value
  card.suit
  # Winning Hands
  # Royal Flush
  # Straight Flush
  # Four of a kind
  # Full House
  # Flush
  # Straight
  # Three of a kind
  # Two pair
  # Pair
  # High Card

  
  def beats?(other_hand)

  end

  def return_cards(deck)
  end

  def to_s
      @cards.join(",") + " (#{points})"
  end
  
# class Hand
#   include PokerHands

#   attr_reader :cards

#   def initialize(cards)

#   end

  def self.winner(hands)

  end

  def trade_cards(old_cards, new_cards)

  end

  def to_s

  end

  private
  def sort!

  end

  def take_cards(cards)

  end

  def discard_cards(old_cards)

  end

  def has_cards?(old_cards)

  end

end
