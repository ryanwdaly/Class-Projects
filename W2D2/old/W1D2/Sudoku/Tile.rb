class Tile
  attr_accessor :value, :given

  def initialize (given, value)
    @value = value
    @given = given
  end

  def to_s
    value.to_s
  end
end
