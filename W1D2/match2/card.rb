# require 'byebug'

class Card
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def ==(card)
    return self == card
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    # byebug
    @letter.to_s
  end


end
