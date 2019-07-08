require_relative "card.rb"
require_relative 'hand.rb'

class Deck

  def self.all_cards
    deck = []
    # Card::SUIT_STRINGS.keys.each do |suit|
    #   Card::VALUE_STRINGS.keys.each do |value|
    Card.suits.each do |suit|
      Card.values.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def take(n)
    raise "not enough cards" if n > self.count
    @cards.shift(n) # take from the front
  end

  def count
    @cards.count
  end

  def return(cards)
    # @cards += cards 
    @cards.concat(cards)
    # @cards.push(*cards)
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_hand # use the cards to make a hand

    # first_five = @cards[0..4] # the first five cards from deck itself
    # first_five = self.take(5) # an instance method
    # Hand.new(first_five)

    Hand.new(self.take(5)) # not @cards.take(5) 
    # need to have Hand class to pass the test
  end
  
end
