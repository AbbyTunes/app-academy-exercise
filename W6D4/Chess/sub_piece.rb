
module Slideable

    def moves(start_pos)
        next_possible_moves = []
        self.move_dirs.each do |x, y| # [-1, 1]
            cur_x, cur_y = start_pos # reset the start_pos in every iteration
            loop do
                cur_x += x
                cur_y += y
                cur_pos = [cur_x, cur_y]
                cur_piece = self.board[cur_pos] # naming: cur_piece, not pos

                if !self.board.valid_pos?(cur_pos) || cur_piece.color == self.color
                    break # whatever outside of this, fits going on with the loop
                end

                next_possible_moves << cur_pos
                if cur_piece.symbol == :none
                    next
                elsif cur_piece.color != self.color # opponent & null 
                    break 
                end
                # if cur_piece.symbol == :none # diffirent color could be null_piece
                #     next_possible_moves << cur_pos
                # elsif cur_piece.color != self.color # not empty pieces, which is opponent, goes to the last branch
                #     next_possible_moves << cur_pos
                #     break 
                # end
            end
        end
        next_possible_moves
    end
end

module Stepable

    def moves(cur_pos)
        next_possible_moves = []
        cur_x, cur_y = cur_pos
        self.move_diffs.each do |x, y|
            new_pos = [(cur_x + x), (cur_y + y)]
            if self.board.valid_pos?(new_pos) &&
               self.board[new_pos].color != self.color
                next_possible_moves << new_pos
            end
        end
        next_possible_moves
    end
end

class Queen < Piece
    include Slideable
    def symbol
        :queen
    end

    def move_dirs
        [
            [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]
        ] 
    end
end

class Bishop < Piece
    include Slideable
    def symbol
        :bishop
    end
    
    def move_dirs
        [
            [-1, -1], [-1, 1], [1, 1], [1, -1]
        ] 
    end
end

class Rook < Piece
    include Slideable
    def symbol
        :rook
    end
    
    def move_dirs
        [
            [-1, 0], [0, 1], [1, 0], [0, -1]
        ] 
    end
end


class King < Piece
    include Stepable
    def symbol
        :king
    end

    def move_diffs
        [
            [1, 0], [0, 1], [-1, 0], [0, -1], [-1, -1], [1, 1], [-1, 1], [1, -1]
        ] 
    end
end

class Knight < Piece
    include Stepable
    def symbol
        :knight
    end
    
    def move_diffs
        [
            [1, 2], [-1, 2], [-1, -2], [1, -2], [2, 1], [2, -1], [-2, -1], [-2, 1]
        ]
    end
end

class Pawn < Piece
    include Stepable
    def symbol
        :pawn
    end
end

