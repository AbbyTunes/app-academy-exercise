require "tdd.rb"

RSpec.describe Array do

    
    describe "::uniq" do
        
        let(:banana) { [1, 2, 1, 3, 3] }
        
        it "creates a unique array" do
            expect(banana.uniq).to eq([1,2,3])
        end  

        it "should not have duplicated elements" do
            expect([1, 1, 1, 1, 1, 1].uniq).to eq([1])
        end
    end

    describe "::two_sum" do

        let(:the_arr) { [-1, 0, 2, -2, 1] }

        it "if two elements add to zero, returns array of indices" do
            expect( the_arr.two_sum).to eq([[0, 4], [2, 3]])
        end
        
        it "returns [] when no pair is found" do
            expect([1, 1, 1, 1].two_sum).to eq([])
        end

        it "finds multiple pairs" do
            expect( [-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

        it "don't count pairs with same element" do
            expect( [-1, 0, 1].two_sum).to eq([[0, 2]])
        end
    end

    describe "::my_transpose" do
        let(:matrix) do
            matrix = [   
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
            ]
        end

        let(:cols) do
            cols = [
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
            ]
        end

        # it "converts the matrix correctly" do
        #     expect(my_transpose(matrix)).to eq(cols)
        # end

        it "should be the same length" do
            expect(my_transpose(matrix).length).to eq(matrix.length)
        end

        it "turns rows to column and vice versa" do
            expect(my_transpose(matrix)[1][2]).to eq(cols[2][1])
        end
    end
end

RSpec.describe do

    describe "#stock_picker" do

        let(:prices) { [10, 5, 40, 50] }

        it "buy in days must be before selling days" do
            expect(prices.index(5) < prices.index(50) ).to eq (true)
        end

        # it "make sure it is the most profitable combination" do
        #     expect(stock_picker(prices)).to eq([5, 50])
        # end
        
    end

end



