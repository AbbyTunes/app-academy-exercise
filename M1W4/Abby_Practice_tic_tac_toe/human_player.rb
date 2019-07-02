class Human_player

    attr_reader :mark

    def initialize
        @mark = :O
    end

    def get_move(instance)
        puts 'Enter a position:'
        puts "eg. '0, 0' \n The numbers should be between 0 and 2 inclusively. "
        input = gets.chomp
        input.split(", ").map(&:to_i) # [0, 0]
    end

    def display(instance)
        puts "Your move:\n\n"
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