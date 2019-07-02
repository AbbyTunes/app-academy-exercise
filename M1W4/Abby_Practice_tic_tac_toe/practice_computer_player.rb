class Computer_player

    attr_reader :mark

    def initialize(name, mark)
        @name = name
        @mark = mark
    end

    def random_move
        moves = []
        (0..2).each do |row|
          (0..2).each do |col|
            pos = [row, col]
            moves << pos if board[pos] = :E
          end
        end
        moves.sample
    end
    
    # def wins?(self.random_move)
    #     board[move] = mark
    #     if board.winner == mark
    #         board[move] = nil
    #         true
    #     else
    #         board[move] = nil
    #         false
    #     end
    # end

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

    # def self.get_move(instance) # to give a position

    #     if winning_move?(instance)
    #         combo = instance.all_lines
    #         combo.each_with_index do |line, i|
    #             line.each_with_index do |ele, j|
    #                 return line[j] = @mark if ele == :E
    #             end
    #         end
    #     end
        
    #     Computer_player.random_move(instance)
    # end

    # def winning_move?(instance)
    #     combo = instance.all_lines # [8 lines]
    #     standard = { @mark=>2, :E=>1 }
    #     counter = Hash.new(0)
    #     combo.each_with_index do |line, i|
    #         line.each { |ele| counter[ele] += 1 }
    #         counter == standard
    #     end
    # end

    def self.display(instance)
        instance.grid.each do |row|
            blk = " | "
            blank = "__"
            display_row = ""
            row.each do |ele|
                if ele == :E
                    display_row += blk + "__"
                else
                    display_row += blk + ele
                end
            end
            puts display_row + blk
        end
    end

end

instance = Board.new
p instance
p Computer_player.display(instance)
p Computer_player.get_move(instance)
