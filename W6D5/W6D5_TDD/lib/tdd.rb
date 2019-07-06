
class Array

    def uniq
        new_arr = []
        self.each do |el|
            new_arr << el unless new_arr.include?(el) 
        end
        new_arr
    end

    def two_sum
        new_arr = []
        self.each_with_index do |el1, i1|
            self.each_with_index do |el2, i2|
                next if i1 >= i2
                new_arr << [i1, i2] if el1 + el2 == 0
            end
        end
        new_arr
    end
end

def my_transpose(arr)

    arr.each_with_index do |row, i|
        row.each_with_index do |col, j|
            arr[i][j], arr[j][i] = arr[j][i], arr[i][j]
        end
    end
end

p [1, 2, 1, 3, 3].uniq # => [1, 2, 3]

p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]

p rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

p row1 = rows[0]
p row2 = rows[1]
p row3 = rows[2]

p cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

p my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])
 # => [[0, 3, 6],
 #    [1, 4, 7],
 #    [2, 5, 8]]


def stock(prices)

    all_choices = []

    prices.each_with_index do |buy, i1|
        prices.each_with_index do |sell, i2|
            next if i1 >= i2 
            all_choices << [buy, sell]
        end
    end

    best_choice = 0 # []

    all_choices.each do |combination| # [ [] ] 
        buy_price, sell_price = combination
        profit = sell_price - buy_price
        if profit > best_choice[1] - best_choice[0]
            best_choice = [buy_price, sell_price]
        end
    end
    best_choice
end

prices = [10, 5, 40, 50]
p stock(prices)  => [5, 50]