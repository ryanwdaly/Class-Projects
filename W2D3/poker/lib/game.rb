require_relative './hand'
require_relative './dealer'

class Poker

    def initialize
      @player1 = ""
      @player2 = ""
      @dealer = Dealer.new
    end

    def get_player_names
      puts "Player 1, please enter your name:"
      @player1 = gets.chomp

      puts "Player 2, please enter your name:"
      @player2 = gets.chomp
    end

    def game
      get_player_names
      deck = @dealer.build_deck
      deck = @dealer.shuffle!(deck)
    end

end
