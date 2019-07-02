class Board

    attr_reader :grid#, :max


    def initialize
        # @grid = Array.new(3) { Array.new(3, :E) } #empty

        @grid = [
            ["o", :E, "x"],
            ["x", :E, "x"],
            ["x", :E, "x"]
        ]
         # @max = 3

        # @grid = [
        #     ["00", "01", "02"],
        #     ["10", "11", "12"],
        #     ["20", "21", "22"]
        # ]


    end
    
    def [](pos) # pos = [0, 0]
        i, j = pos
        @grid[i][j] # @grid[pos] = @grid[0][0]
    end

    def place_mark(pos, mark)
        if empty?(pos)
            @grid[pos] = mark
        else
            puts "the position is taken" 
        end
    end

    def empty?(pos)
        @grid[pos] == :E
    end

    # def winner
    #     mark = check_rows_columns
    #     if mark != :E
    #         return mark
    #     end

    #     return check_diagonals
    # end

    # def check_rows_columns
    #     mark = :E

    #     (0..2).each do |i|
    #         row_count = 0
    #         column_count = 0
    #         if @grid[i][0] != :E
    #             row_count += 1
    #         end
    #         if @grid[0][i] != :E
    #             column_count += 1
    #         end
    #         (0..1).each do |j|
    #             if @grid[i][j] == @grid[i][j+1]
    #                 row_count += 1
    #             end
    #             if @grid[j][i] == @grid[j+1][i]
    #                 column_count += 1
    #             end
    #         end
    #         if row_count == 3
    #             mark = @grid[i][0]
    #             break
    #         elsif column_count == 3
    #             mark = @grid[0][i]
    #             break
    #         end
    #     end
    #     mark
    # end

    # def check_diagonals
    #     forward_count = 0
    #     backwards_count = 0

    #     (0...@max - 1).each do |i|
    #         if @grid[i][i] != :E && @grid[i][i] == @grid[i+1][i+1]
    #             forward_count += 1
    #         end

    #         if @grid[@max - i - 1][i] != :E && @grid[@max - i - 1][i] == @grid[@max - (i + 1) -1][i+1]
    #             backwards_count += 1
    #         end
    #     end

    #     if forward_count == @max - 1
    #         return @grid[0][0]
    #     end

    #     if backwards_count == @max - 1
    #         return @grid[@max - 1][0]
    #     end

    #     return :E
    # end

    def win?

        combo = self.all_lines # [8 lines]
        # combo.any? { |line| every_ele_marked?(line) } # b or w

        combo.any? do |line|
            # (0...line.length-1).none? do |i|
            #     line[i] == :E || line[i] != line[i+1]
            # end
            if every_ele_marked?(line)
                line[0]
                puts "#{line[0]} won!"
                true
            else
                false
            end
        end

    end

    def every_ele_marked?(line)
        (0...line.length-1).all? { |i| line[i] == line[i+1] && line[i] != :E }
    end

    def all_lines
        winning_lines = []

        diagonal_2 = []
        j = @grid.length

        @grid.each_with_index do |row, i|
            winning_lines << row  # 3 horizontal

            j -= 1
            diagonal_2 << @grid[i][j]
        end
        winning_lines << diagonal_2

        diagonal_1 = []        
        (0..2).each do |j|

            verticals = []
            (0..2).each do |i| 
                verticals << @grid[i][j] # 3 vertical
                diagonal_1 << @grid[i][j] if i == j # 1 diagonal
            end
            winning_lines << verticals

        end
        winning_lines << diagonal_1
        winning_lines
    end

    # def win?

    #     @grid.any? do |row|  # all rows
    #         row.all? { |ele| ele == row[0] && ele != :E }
    #     end

    #     (0..2).all? do |i|  # all columns
    #         (0..2).any? do |j|
    #             @grid[i][j] == @grid[0][j] && @grid[0][j] != :E
    #         end
    #     end

    #     (0..2).all? do |i|  # two diagonals
    #         (0..2).each do |j|
    #             if @grid[i][j] == @grid[i][i]
    #         end
    #     end

    #     false
    # end

    def over?
        @grid.flatten.none? { |ele| ele == :E } || self.win?
    end

    def tie?
        over? && !win?
    end

end

instance = Board.new
p instance
p instance[[0, 0]]
p "winner = "
p instance.all_lines
# p instance.winner
p instance.win?
