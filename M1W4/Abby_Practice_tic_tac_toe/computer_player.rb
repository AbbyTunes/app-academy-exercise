# require "byebug"

class Computer_player

    attr_reader :mark

    def initialize
        @mark = :X
    end

    def get_move(instance)

        moves = []
        (0..2).each do |row|
          (0..2).each do |col|
            pos = [row, col]
            moves << pos if instance[pos] == :E
          end
        end

        moves.each do |pos|
            return pos if self.wining_move?(pos, instance)
        end

        moves.sample
        # debugger
    end
    
    def wining_move?(pos, instance)

        instance[pos] = :X
        if instance.winner == :X
            instance[pos] = :E
            return true
        end

        instance[pos] = :O
        if instance.winner == :O
            instance[pos] = :E
            return true
        end

        instance[pos] = :E
        false
    end

    def display(instance)

        puts "Computer player:\n\n"
        instance.grid.each do |row|
            blk = " | "
            blank = "_"
            display_row = ""
            row.each do |ele|
                if ele == :E
                    display_row += blk + blank
                else
                    display_row += blk + "#{ele}"
                end
            end
            puts display_row + blk
        end
        puts
    end

end

# instance = Board.new
# p instance
# computer = Computer_player.new(:X)
# p computer.get_move(instance)
# p Computer_player.display(instance)
