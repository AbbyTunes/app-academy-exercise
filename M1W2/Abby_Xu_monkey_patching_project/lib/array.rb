# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.size.to_f
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        mid = (sorted.size - 1) / 2
        if self.size.odd?
            sorted[mid]
        else
            (sorted[mid] + sorted[mid + 1]) / 2.0
        end
    end

    def counts
        counter = Hash.new(0)
        self.each { |el| counter[el] += 1 }
        counter
    end

    def my_count(*val)
        count = 0
        self.each { |ele| count += 1 if val.include?(ele) }
        count
    end

    def my_index(*val)
        self.each_with_index { |ele, i| return i if val.include?(ele) }
        nil
    end

    def my_uniq
        uniq = []
        self.each { |ele| uniq << ele if !uniq.include?(ele) }
        uniq
    end

    def my_transpose
        new_arr = []
        self.each_with_index do |row, i|
            new_row = []
            row.each_with_index do |column, j|
                new_row << self[j][i]
            end
            new_arr << new_row
        end
        new_arr
    end

end
