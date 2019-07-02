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
    end
    
    def wining_move?(pos, instance)

    instance[pos] = @mark

        if instance.winner == mark
            instance[pos] = :E
            true
        else
            instance[pos] = :E
            false
        end
    end

    def display(instance)
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
        puts "~~~~~~~~~~"
        puts
    end

end