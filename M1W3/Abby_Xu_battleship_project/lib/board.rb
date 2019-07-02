class Board

    attr_reader :size

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            true
        else
            self[position] = :X
            false
        end
    end 

    def place_random_ships
        most = @size * 0.25
        while self.num_ships < most
            random_row = rand(0...@grid.length)
            random_col = rand(0...@grid.length)
            @grid[random_row][random_col] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N 
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
