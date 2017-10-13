require_relative "Board.rb"
require_relative "Card.rb"

class Game

  attr_accessor :board, :prev_pos

  def initialize
    @board = Board.new
    @board.populate
  end

  def make_guess(pos)
    if prev_pos == nil
      @prev_pos = previous_guess(pos)
    else
      if @board[pos].value != prev_pos.value
        puts prev_pos.value
        puts board[pos].value
        board[pos].hide

        prev_pos.hide
      end
      @prev_pos = nil
    end
  end

  def play_loop

    while !@board.won?
      @board.render

      puts "Pick a card"

      guessed_pos = gets.chomp.split.each {|el| el.to_i}
      if board[guessed_pos].state == :up
        puts "Card is already flipped"
        next
      end
      p @board.reveals(guessed_pos)


      make_guess(guessed_pos)

    end

    @board.render
    puts "Game Over"
  end

  def previous_guess(pos)
    board[pos]

  end
end



if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play_loop
end
