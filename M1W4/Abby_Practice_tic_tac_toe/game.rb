require_relative "board"
require_relative "human_player"
require_relative "computer_player"

# require "byebug"
class Game

    attr_accessor :p1, :p2, :mark1, :mark2, :board, :current_player

    def initialize
        @board = Board.new
        @p1 = Human_player.new
        @p2 = Computer_player.new
        @current_player = @p1
    end

    def play
        @current_player.display(@board)
        self.play_turn until @board.over?

        if @board.win?
            i = @board.winner
            puts "You won the game!" if i == :O
            puts "You lost the game!" if i == :X
        else
            puts "GAME OVER - It's a tie game!"
        end
    end

    def play_turn

        current_move = false
        while current_move == false
            move = @current_player.get_move(@board)
            mark = @current_player.mark
            i = @board.place_mark(move, mark)
            if i == :X || i == :O 
                current_move = true
            end
        end

        @current_player.display(@board)
        self.switch_players!
    end

    def switch_players!
        if @current_player == @p1 
            @current_player = @p2
        else
            @current_player = @p1
        end
    end

end




def start_game

    puts "\n ** Welcome to Abby's Tic Tac Toe Game! **"
    puts
    puts " ** FEATURES ** \n
1. This computer player will take a winning move, and will block your winning move.
2. When game over, it will indicate if you win, you lose, or it is a tie game.
3. It allows you to try again if you enter an invalid move.
4. The board grid has a sophisticated display.\n"
    puts "\nType 'start' to enter the game:\n"
    
    input = gets.chomp
    puts
    new_game = Game.new
    new_game.play
end

start_game 


