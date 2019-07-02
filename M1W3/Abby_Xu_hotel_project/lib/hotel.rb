require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize (name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            return print 'sorry, room does not exist'
        end

        if @rooms[room_name].add_occupant(person)
            print 'check in successful'
        else
            print 'sorry, room is full'
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room_instance| !room_instance.full? }
    end

    def list_rooms
        @rooms.each { |room_name, room_instance| puts "#{room_name} : #{room_instance.available_space}" }
    end

end
