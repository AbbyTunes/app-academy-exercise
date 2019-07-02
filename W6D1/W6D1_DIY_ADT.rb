class Stack

    attr_reader :underlying_arr

    def initialize
        @underlying_arr = []
    end

    def push(el)
        @underlying_arr.push(el)
    end

    def pop
        @underlying_arr.pop
    end

    def peek
        @underlying_arr.last
    end

end

class Stack

    attr_reader :underlying_arr
    
    def initialize
        @underlying_arr = []
    end

    def enqueue(el)
        @underlying_arr.push(el)
    end

    def dequeue
        @underlying_arr.shift
    end

    def peek
        @underlying_arr.first
    end

end

class Map

    attr_reader :underlying_arr

    def initialize
        @underlying_arr = []
    end

    def set(key, value)
        @underlying_arr.each_with_index do |arr, i|
            if arr[0] == key
                arr[1] = value
            end
        end

        if @underlying_arr.none? { |arr| arr[0] == key }
            @underlying_arr.push([key, value])
        end
        value
    end

    def get(key)
        @underlying_arr.each do |arr|
            return arr[1] if arr[0] == key
        end
        nil
    end

    def delete(key)
        @underlying_arr.each_with_index do |arr, i|
            if arr[0] == key
                @underlying_arr.delete_at(i) # delete(@underlying_arr[i])
            end
        end
        @underlying_arr
    end

    def show
        arr = self
        arr.map do |el|
            if el.is_a?(Array)
                el.show
            else
                el
            end
        end
    end

end