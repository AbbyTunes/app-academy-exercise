require_relative "board.rb"
require_relative "cursor.rb"
require 'colorize'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render_loop
        loop do
            system("clear")
            self.render
            @cursor.get_input
        end
    end

    def render
        light = :cyan
        dark = :green
        white_piece = :white
        black_piece = :black
        cursor_block = :yellow

        @board.board.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if i.odd?
                    if j.even?
                        background_color = light
                    else # j.odd?
                        background_color = dark
                    end
                else # i.even?
                    if j.odd?
                        background_color = light
                    else # j.even?
                        background_color = dark
                    end
                end

                piece = @board[[i, j]]
                if piece.color == :white
                    piece_color = white_piece
                elsif piece.color == :black
                    piece_color = black_piece
                else
                    piece_color = :default
                end

                cursor_x, cursor_y = @cursor.cursor_pos
                if cursor_x == i && cursor_y == j
                    background_color = cursor_block
                end


                # store all the actual string into the variable str
                str = sprintf "  %-7s " % col.to_s  # str print format

                # print the string with formats
                print str.colorize(:color => piece_color, :background => background_color)
            end
            puts "\n"
        end
        puts "\n\n"
    end

end

if $PROGRAM_NAME == __FILE__
    board = Board.new()
    display = Display.new(board)
    display.render_loop
end