require_relative "piece.rb"
require_relative "sub_piece.rb"

class Board

    attr_reader :board, :sentinel

    def initialize()

        @sentinel = NullPiece.instance

        @board = Array.new(8) { Array.new(8) }

        @board.each_with_index do |row, i|
            color = :none
            if i.between?(0, 1)
                color = :black
            elsif i.between?(6, 7)
                color = :white
            end

            row.each_with_index do |col, j|
                pos = [i, j]
                if i == 0 || i == 7  # compilcated row
                    if j == 0 || j == 7
                        self[pos] = Rook.new(color, self, pos)
                    elsif j == 1 || j == 6
                        self[pos] = Knight.new(color, self, pos)
                    elsif j == 2 || j == 5
                        self[pos] = Bishop.new(color, self, pos)
                    elsif j == 4
                        self[pos] = Queen.new(color, self, pos)
                    elsif j == 3
                        self[pos] = King.new(color, self, pos)
                    end
                elsif i == 1 || i == 6
                    # self[pos] = Pawn.new(color, self, pos)
                    self[pos] = @sentinel
                else
                    self[pos] = @sentinel
                end
            end
        end
    end

    def display_board
        @board.each do |row|
            row.each do |col|
                printf "%-6s | " % col.to_s
            end
            puts "\n ---- \n"
        end
        puts
        puts "!!!!!"
        puts
    end

    def move_piece(color, start_pos, end_pos)

        if !valid_pos?(start_pos)
            raise "the start_pos #{start_pos} is invalide"
        end

        current_piece = self[start_pos]

        if current_piece == @sentinel
            raise "No piece at start_pos #{start_pos}"
        end

        if !valid_pos?(end_pos)
            raise "Piece cannot move to end_pos #{end_pos}"
        end

        next_possible_moves = current_piece.moves(start_pos)

        unless next_possible_moves.include?(end_pos)
            raise "#{current_piece.to_s} is not allowed to move to end_pos #{end_pos}"
        end

        if current_piece.color == color # if I'm moving the right color piece
            self[end_pos] = current_piece
            self[start_pos] = @sentinel
        else  # I'm moving other people's piece
            raise "you cannot move #{current_piece.color} piece!"
        end
    end


    def valid_pos?(pos)
        x, y = pos
        return false if !x.between?(0, 7)
        return false if !y.between?(0, 7)
        true
    end

    def [](pos)
        i, j = pos
        @board[i][j]
    end

    def []=(pos, val)
        i, j = pos
        @board[i][j] = val
    end

end

if $PROGRAM_NAME == __FILE__
    test = Board.new()
    test.display_board
    move_first_knight = test.move_piece(:black, [0, 1], [2, 0])
    test.display_board
    move_black_king = test.move_piece(:black, [0, 3], [1, 3])
    test.display_board
    bishop_first_move = test.move_piece(:black, [0, 2], [1, 1])
    test.display_board
    bishop_eat_the_rook = test.move_piece(:black, [1, 1], [7, 7])
    test.display_board
end