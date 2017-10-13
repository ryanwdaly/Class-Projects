class TowersOfHanoi
  attr_reader :tower1, :tower2, :tower3
  def initialize
    @tower1 = [1,2,3]
    @tower2 = []
    @tower3 = []
  end

  def play
    valid_input = false
    until valid_input
      valid_input = false
      puts "Pick a tower to move from"
      from_tower = gets.chomp
      case from_tower
      when 1
        from_tower = @tower1
      when 2
        from_tower = @tower2
      when 3
        from_tower = @tower3
      end

      puts "Pick a tower to move to"
      to_tower = gets.chomp
      case to_tower
      when 1
        to_tower = @tower1
      when 2
        to_tower = @tower2
      when 3
        to_tower = @tower3
      end
      valid_input = valid_move(from_tower, to_tower)
    end
  end

  def move(from_tower, to_tower)
  end

  def valid_move?(from_tower, to_tower)
    return false if from_tower.nil?
    return false if to_tower.size > 2
    if !to_tower.nil? && to_tower.first > from_tower.first
      return false
    end
    true
  end

  def won?
  end


end

if __FILE__ == $PROGRAM_NAME
  a = TowersOfHanoi.new
  a.play
end
