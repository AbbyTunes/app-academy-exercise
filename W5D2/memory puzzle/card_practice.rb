# Card 
#     -# An instance variable for (a..z).to_a.sample
#     - Display card information ( facedown or faceup )
#         - hidden - face down
#         - revealed - faced up
#     - to_s # show letter
#     - == (compare two instance)


class Card

    attr_reader :num
    attr_accessor :facedown

    def initialize(num)
        @num = num
        @facedown = true
    end

    def hide 
        @facedown = true
    end

    def reveal
        @facedown = false
    end

    def ==(another_instance) # check if instance_1 == instance_2
        self.num == another_instance.num
    end

    def to_s #instance.num.to_s
        self.num.to_s
    end

end