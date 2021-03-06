class Human_player

    attr_reader :mark

    def initialize
        @mark = :O
    end

    def get_move(instance)
        puts 'Enter a position:'
        puts "eg. '0, 0' \n The numbers should be between 0 and 2 inclusively."
        input = gets.chomp
        pos = input.split(", ").map(&:to_i) # [0, 0]
        pos.each do |num|
            if num < 0 || num > 2
                puts "The input is invalid, please try again"
                puts
                puts "~~~~~~~~~~"
                puts
                return get_move(instance)
            end
        end
        pos
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