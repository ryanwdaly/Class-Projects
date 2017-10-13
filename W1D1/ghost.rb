class Ghost
  attr_accessor :players, :fragment, :dictionary

  def initialize(players, fragment, dictionary)
    @players = players
    @fragment = fragment
    @dictionary = dictionary
  end

  def play_round
    #print current player
    #print current fragment
    until is_word?
      until true
        puts "Please pick a letter"
        input = gets.chomp

         if valid_play?(input)
           update(input)
           break
         end

         next_player!
      end
    end

    puts "#{previous_player} lost, #{current_player} won."


  end

  def is_word?(string)
    dictionary.include?(string)
  end

  def update(input)
    @fragment += input
  end

  def current_player
    players.last
  end

  def previous_player
    players.first
  end

  def next_player!
    current_player, previous_player = previous_player, current_player
  end

  def valid_play?(string)
    guess = @fragment + string
    dictionary.any? {|word| word.start_with?(guess)}
  end
end


if __FILE__ == $PROGRAM_NAME
  puts "Panda"
end
