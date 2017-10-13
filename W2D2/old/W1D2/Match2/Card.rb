class Card

  attr_accessor :value, :state

  def initialize(value)
    @state = :down
    @value = value
  end

  def hide
    @state = :down
  end

  def reveal
    @state = :up
  end

  def to_s
    return value #if @state == :up
  end

  def equals(card2)
    if value == card2.value
      true
    else
      false
    end
  end

end
