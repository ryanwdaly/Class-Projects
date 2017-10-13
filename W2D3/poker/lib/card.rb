class Card
  attr_reader :suit, :value
    CARD_TITLES = [nil,
                  "Ace",
                  "One",
                  "Two",
                  "Three",
                  "Four",
                  "Five",
                  "Six",
                  "Seven",
                  "Eight",
                  "Nine",
                  "Ten",
                  "Jack",
                  "Queen",
                  "King"]
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def title(value)
    CARD_TITLES[value+1]

  end

  def to_s
    title = title(@value)
    "#{title} of #{suit}"
  end
end
