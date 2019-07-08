require_relative './tie_breaker'

module PokerHands # within Hand class

  include TieBreaker

  # RANK class constance is an array of ranks
  RANKS = [
    :royal_flush,
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  def rank # hand.rank
    RANKS.each do |rank_set|
      # private method call
      if has_cards?(rank_set)
        rank_set == :straight ? Card::POKER_VALUE[:ace] = 1 : Card::POKER_VALUE[:ace] = 14 
        # card :ace is defined as 14 in Card class
        return rank_set
      end
    end
  end

  def rank_num
    RANK.index(rank)
  end

  def rank_set
    rank_sets = []
    RANKS.each do |rank_set|
      if @cards.has_cards?(rank_set)
        rank_set << rank_set
      end
    end
    rank_sets
  end

  def <=>(other_hand)

    if self.rank != other_hand.rank
      self.rank <=> other_hand.rank
      # no situation 0
    else # self.rank == other_hand.rank
      tie_breaker(other_hand)
      return 0
    end
  end

  protected
  def card_value_count(value)

  end

  def high_card

  end

  def cards_without(value)

  end

  def has_a?(value_or_suit)

  end

  def royal?
  
  end

  def set_card(n)
   
  end

  private
  def royal_flush?

  end

  def straight_flush?

  end

  def four_of_a_kind?
 
  end

  def full_house?

  end

  def flush?

  end

  def straight?
  
  end

  def three_of_a_kind?
    
  end

  def two_pair?

  end

  def one_pair?

  end

  def high_card?

  end
end
