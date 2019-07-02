class Dog

    attr_reader :name, :breed, :age, :favorite_foods
    attr_writer :age

    def initialize(name, breed, age, bark, favorite_foods)
        @name, @breed, @age, @bark, @favorite_foods = name, breed, age, bark, favorite_foods
    end

    def bark
        self.age > 3 ? @bark.upcase : @bark.downcase
    end

    def favorite_food?(food)
        @favorite_foods.map(&:downcase).include?(food.downcase)
    end

end
