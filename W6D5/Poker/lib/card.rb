class Card
  include Comparable

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :two   => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

    POKER_VALUE = {
    :two => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14,
  }

    SUIT_VALUE = {
    :clubs    => 1,
    :diamonds => 2,
    :hearts   => 3,
    :spades   => 4
  }

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    POKER_VALUE.keys  # compare value not strings
  end

  def self.royal_values
    POKER_VALUE[-5..-1]
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    # if !Card.suits.include?(suit) || !Card.values.include?(value)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      raise "the suit #{suit} or value #{value} is invalid"
    end
    @suit = suit
    @value = value
  end

  def to_s
    VALUE_STRINGS[value].to_s + SUIT_STRINGS[suit].to_s
  end

  def ==(other_card)
    @suit == other_card.suit && @value == other_card.value
  end

  def <=>(other_card) # beats

    # return 0 if self == other_card 
    # included in situation 2

    if self.value != other_card.value 
      # they are not equal, won't have situation 0
      # && suit != other_card.suit #situation 0
      POKER_VALUE[value] <=> POKER_VALUE[other_card.value]
    
    else #self.value == other_card.value
      Card::SUIT_VALUE[suit] <=> Card::SUIT_VALUE[other_card.suit]
    end

    # if, else, no need to #return
    # if, end  if, end  need to # return
  end

end

# SOLUTION
  # def <=>(other_card) # beats
  #   if self == other_card
  #     0
  #   elsif value != other_card.value
  #     POKER_VALUE[value] <=> POKER_VALUE[other_card.value]
  #   elsif value == other_card.value
  #     # different ways to call the suits 
  #     # found keys, then found index in keys array
  #     Card.suits.index(suit) <=> Card::SUIT_STRINGS.keys.index(other_card.suit)
  #   end
  # end

