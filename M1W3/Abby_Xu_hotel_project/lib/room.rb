class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @occupants.size >= @capacity
    end

    def available_space
        @capacity - @occupants.size
    end

    def add_occupant(name)
        if !full?
            @occupants << name
            true
        else
            false
        end
    end

end
