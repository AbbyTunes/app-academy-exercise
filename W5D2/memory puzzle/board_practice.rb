
require_relative "card_practice"

class Board

    attr_accessor :grid, :cards

    def initialize
        @grid = Array.new(4) { Array.new(4) } # { |row| row = [] }
        @cards = Board.card_factory  # @cards = []
        self.make_grid
    end

    def self.card_factory
        nums = (1..8).to_a  #.shuffle
        pair = nums * 2      #.concat(nums)
        shuffle = pair.shuffle
        # p shuffle
        shuffle.map { |num| Card.new(num) }

        # shuffle.each { |num| @cards << Card.new(num) }
        #class method, cannot reference instance or instance variable
    end

    def make_grid #if this is Class method, the self inside also means Class
        i = 0  # no need for a while loop, it will iterate 16 times and then stop
        (0..3).each do |x|
            (0..3).each do |y|
                pos = [x, y] # put "pos array" in the [bracket]
                self[pos] = @cards[i]
                # || @grid[x][y] = @cards[i] 
                # instance variable, need to be in the instance method
                i += 1
            end
        end
    end

    def print_grid

        puts "  " + (0..3).to_a.join("   ")
        @grid.each_with_index do |row, i|
            str = ""
            blank, block = "_", " | "

            arr = row.map do |el|
                el.facedown ? blank : el.to_s
            end
            str += arr.join(" | ")
            puts i.to_s + " " + str
        end
    end

    def print_hidden_grid
        puts "  " + (0..3).to_a.join("   ")
        @grid.each_with_index do |row, i|
            puts i.to_s + " " + row.map { |ele| ele = "_" }.join(" | ")
        end
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, card)
        x, y = pos
        @grid[x][y] = card
    end

end

# test = Board.new
# test.print_hidden_grid
