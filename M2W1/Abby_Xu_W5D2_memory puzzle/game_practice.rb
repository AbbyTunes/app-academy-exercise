require_relative "board_practice"
require_relative "card_practice"
require_relative "player_practice"
# require "byebug"

class Game

    # card == card_instance # @facedown = true
    # @board[pos] = card_instance

    attr_accessor :board, :player

    def initialize#(player)
        @board = Board.new
        # @player = player
        @player = Game.get_player
    end

    def self.get_player
        puts "What's your name?"
        player_name = gets.chomp
        Player.new(player_name)
    end

    def keep_playing_until_over

        puts "\n#{@player.name}, good luck! :) "
        @board.print_grid
        play_one_round until over?
        puts "\nYou won!"
    end
    
    def play_one_round

        pos_1 = player.get_pos(@board)  # pos_1 until is_one_valid?(pos_1)
        value_1 = guess_value(pos_1)

        pos_2 = player.get_pos(@board)  # pos_2 until is_two_valid?(pos_1, pos_2)
        value_2 = guess_value(pos_2)

        # match?(value_1, value_2)
        take_action(value_1, value_2, pos_1, pos_2)
        # over?
    end

    def guess_value(pos)
        @board[pos].reveal
        puts
        @board.print_grid
        puts
        @board[pos].num  #order matters: always return number
    end

    def match?(v1, v2)
        v1 == v2
    end

    def take_action(v1, v2, pos_1, pos_2)

        if match?(v1, v2)
            puts "\nYou got two tiles!\n"
            return
        end

        puts "They don't match"
        sleep(2)
        system("clear")
        @board[pos_1].hide
        @board[pos_2].hide
        @board.print_grid
    end

    def over?
        @board.grid.flatten.all? { |card| card.facedown == false }
    end

    # def won?
    # end
end

if $PROGRAM_NAME == __FILE__

    puts "Welcome to Memory Puzzle!\n\n"
    # player_name = "Abby"
    new_game = Game.new#(player)
    # Game.get_player
    new_game.keep_playing_until_over
end

# - play: loop until board.over?
#     - render the board
#     - prompt the player for input
#     - get the pos from the player

#     - make_guess (take action at the pos)
#         - step 1: hold the card up (wait for card 2) - # set a previous_guess variable
#         - step 2: card 2 face up (check if match with card 1 ) # guessed_pos 
#             - if match then leave both faced up
#             - if not flip both faced down
#             - Reset that previous_card variable