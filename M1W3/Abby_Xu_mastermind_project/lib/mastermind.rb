require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_instance)
        puts "number of exact matches: #{@secret_code.num_exact_matches(code_instance)}"
        puts "number of near matches: #{@secret_code.num_near_matches(code_instance)}"
    end

    def ask_user_for_guess
        puts "Enter a code: "
        input = gets.chomp
        code_instance = Code.from_string(input)
        self.print_matches(code_instance)
        @secret_code == code_instance
    end

end
