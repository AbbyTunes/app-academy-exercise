
# require "byebug"
class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_guess
        puts "\n\nplease enter two numbers between 0 and 3: \neg. '0, 0'\n"
        prompt = gets.chomp
        pos = prompt.split(", ").map(&:to_i) # pos = [0, 0]
    end

    def get_pos(board_instance)
        pos = get_guess

        until is_valid?(pos)
            puts "The input is not valid. Please try again"
            pos = get_guess
        end

        until is_facedown?(pos, board_instance)
            puts "This tile is already taken. Please try again"
            pos = get_guess
        end
        pos
    end
    def is_valid?(pos)
        return false if !pos.is_a?(Array) || pos.size != 2
        pos.none? { |i| !i.is_a?(Integer) && i < 0 && i > 3 }
    end

    def is_facedown?(pos, board_instance)
        board_instance[pos].facedown
    end

end