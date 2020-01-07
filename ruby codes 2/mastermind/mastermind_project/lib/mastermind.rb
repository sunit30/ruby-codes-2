require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code=Code.random(length)
    end

    def print_matches(instance)
        puts "exact matches: #{@secret_code.num_exact_matches(instance)}"
        puts "near matches: #{@secret_code.num_near_matches(instance)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        code=gets.chomp
        user_instance=Code.from_string(code)
        self.print_matches(user_instance)
        @secret_code.num_exact_matches(user_instance)==@secret_code.length
    end
end
