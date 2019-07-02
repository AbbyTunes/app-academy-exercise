class Employee

    attr_reader :name, :title

    def initialize(name, title)
        @name, @title, @earnings = name, title, 0
    end

    def pay(amt)
        @earnings += amt
    end

end
