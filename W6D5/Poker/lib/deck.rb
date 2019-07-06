require_relative "card.rb"
require_relative 'hand.rb'

class Deck

  def self.all_cards
    deck = []
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_STRINGS.keys.each do |value|
    # Card.suits.each do |suit|
    #   Card.values.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def deal_hand
    # first_five = @cards.take(5) # the first five cards
    # first_five = @cards[0..4]
    Hand.new(@cards.take(5))  # need to have Hand class to pass the test
  end

  def take(n)
    raise "not enough cards" if n > @cards.count
    @cards.shift(n) # take from the front
  end

  def count
    @cards.count
  end

  def return(cards)
    # @cards += cards #don't use shovel and flatten
    @cards.push(*cards) # either way
  end

  def shuffle
    @cards.shuffle!
  end
  
end
