require 'singleton'

class Piece

    attr_reader :symbol, :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        :general
    end

    def to_s
        self.symbol.to_s
    end
end

class NullPiece < Piece
    include Singleton

    def initialize()
        # super(:none, nil, nil)
    end

    def symbol
        ""
    end
end