class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, :E) } #empty

        # @grid = [
        #     ["o", :E, "x"],
        #     ["x", :E, "x"],
        #     ["x", :E, "x"]
        # ]

        # @grid = [
        #     ["00", "01", "02"],
        #     ["10", "11", "12"],
        #     ["20", "21", "22"]
        # ]
    end

    def [](pos) # pos = [0, 0]
        i, j = pos
        @grid[i][j] # self[pos]instance[pos] = @grid[0][0]
    end

    def []=(pos, val)
        i, j = pos
        @grid[i][j] = val
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

    def over?
        @grid.flatten.none? { |ele| ele == :E } || win?
    end

    def winner
        combo = self.all_lines
        combo.any? do |line|
            if every_ele_marked?(line)
                line[0]
                puts "#{line[0]} won!"
                true
                return
            end
        end
        puts "nobody won yet"
        false
    end

    def win?
        combo = self.all_lines # [8 lines]
        combo.any? { |line| every_ele_marked?(line) }
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

    def tie?
        over? && !win?
    end

end

instance = Board.new
p instance
# p instance[[0, 0]]
# p instance[[0, 0]] = "42"
# p instance.all_lines
# p instance
# p instance.winner
