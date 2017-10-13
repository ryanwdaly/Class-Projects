class Tile

  def initialize(num)
    @num = num

  end

  def has_value?
    return true unless num == 0
    false
  end

  def to_s
    @num.to_s
  end
end
