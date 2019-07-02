class Board

    attr_accessor :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, :E) } #empty
    end

    def [](pos) # pos = [0, 0]
        i, j = pos
        @grid[i][j] # self[pos] = @grid[0][0]
    end

    def []=(pos, val)
        i, j = pos
        @grid[i][j] = val
    end

    def place_mark(pos, mark)

        if empty?(pos)
            self[pos] = mark
        else
            puts " - the position is taken - "
            puts
            puts "~~~~~~~~~~"
            puts
            false
        end
    end

    def empty?(pos)
        self[pos] == :E
    end

    def over?
        @grid.flatten.none? { |ele| ele == :E } || self.win?
    end

    def winner
        combo = self.all_lines
        combo.each do |line|
            return line[0] if every_ele_marked?(line)
        end
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

end
