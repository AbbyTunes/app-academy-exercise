require_relative './poker_hands'

class Hand

  include PokerHands

  #expect(hand.cards).to match_array(cards)
  attr_reader :cards 

  def self.winner(hands)
    # return rank_set with the highest ranking
    lowest_rank_num = 100
    winner = nil
    hands.each do |hand|
      if hand.rank_num < lowest_rank_num
        lowest_rank_num = hand.rank_num
        winner = hand
      end
    end
    winner
  end

  def initialize(cards)
    raise 'must have five cards' if cards.length != 5
    @cards = cards.sort!
  end

  def trade_cards(old_cards, new_cards)

    # take cards first
    take_cards(new_cards) 

    # then check validation 
    # private method cannot be called on an explicit object
    raise 'cannot discard unowned card' unless has_cards?(old_cards)
 
    # discard old cards
    discard_cards(old_cards) 

    # check total count
    raise 'must have five cards' if @cards.length != 5
  end
  
  def beats?(other_hand)
    # see which ranking higher
    case self.rank <=> other_hand.rank
    when 1
      true
    when 0
      false
    when -1
      false
    end
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
      @cards.join(",") + " (#{points})"
  end

  private
  def sort!
    @cards.sort!
  end

  def take_cards(new_cards)
    @cards += new_cards
  end

  def discard_cards(old_cards)
    @cards -= old_cards
    # @cards.delete(old_cards)
  end

  def has_cards?(chosen_cards)
    chosen_cards.all? { |card| @cards.include?(card) }
  end

end
