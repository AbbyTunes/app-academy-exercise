require_relative "poly_tree_node"

class KnightPathFinder

    def initialize

        # positions = []
        @considered_positions = [ [0, 0] ]
        @possible_moves = [
            [-2, -1], [-2, 1], [-1, -2], [-1, 2], 
            [1, -2], [1, 2], [2, -1], [2, 1]
            ]
        # @children_nodes = []
    end

    def self.root_node
        PolyTreeNode.new([0, 0]) # parent_node
    end

    def self.valid_moves(pos)
        # set limits /contraints 
        # if possible, create children nodes of this pos/root_node
        valid_possible_moves = []
        @possible_moves.each do |step|
            new_pos = move_one_step(pos, step) # => new_pos

            if check_one_step_valid?(new_pos) # => t/f
                valid_possible_moves << new_pos
            end
        end
        valid_possible_moves
    end

    def check_one_step_valid?(new_pos)
        return false if self[new_pos].nil?
        true
    end

    def move_one_step(pos, step)
        x = pos[0] + step[0]
        y = pos[1] + step[1]
        new_pos = [x, y] 
    end

    def [](pos)
        x, y = pos
        self[x][y] 
    end

    def []=(pos, indices)
        x, y = pos
        self[x][y] = indices
    end

    def build_move_tree
        new_move_positions

    end

    def find_path
    end

    def new_move_positions(pos)
        valid_moves(pos)

    end
end

kpf = KnightPathFinder.new([0, 0])

kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
