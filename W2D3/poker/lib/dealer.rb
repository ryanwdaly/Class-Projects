require_relative './card'

class Dealer
  attr_reader :deck

  SUITS = %w(Hearts Spades Diamonds Clubs)
  VALUES = (1..13).to_a

  def initialize
    @deck = []
  end

  def build_deck
    4.times do |suit_idx|
      13.times do |value_idx|
        @deck << Card.new(SUITS[suit_idx], VALUES[value_idx])
      end
    end
    @deck
  end

  def shuffle!(deck)
    deck.shuffle!
  end

  def deal_one_card
    @deck.pop
  end


end
