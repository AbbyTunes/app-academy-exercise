require_relative "poly_tree_node"

class KnightPathFinder

    # def initialize
    #     @root_node = KnightPathFinder.root_node
    #     @considered_positions = []
    # end

    # def self.root_node
    #     PolyTreeNode.new([0, 0])
    # end

POSSIBLE_MOVES = [
[-2, -1], [-2, 1], [-1, -2], [-1, 2], 
[1, -2], [1, 2], [2, -1], [2, 1]
]
    
    def initialize(start_pos)
        @current_position = start_pos
        @root_node = KnightPathFinder.root_node(start_pos)
        @current_node = root_node
        @considered_positions = [start_pos]
        @move_tree = [current_node, children_nodes]
        # @children_nodes = []
    end


    def self.valid_moves(pos) #node_ins
        # pos = node_ins.value
        
        # set limits /contraints 
        # if possible, create children nodes of this pos/root_node
        valid_possible_moves = []
        POSSIBLE_MOVES.each do |step|
            new_pos = move_one_step(pos, step) # => new_pos

            if check_one_step_valid?(new_pos) # => t/f
                valid_possible_moves << new_pos
            end
        end
        valid_possible_moves #arr
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

    def build_move_tree(start_pos) # build tree of a known pos

        move_tree = [@current_node] + new_move_positions(start_pos)
        move_tree << new_move_positions(start_pos)
        generating nodes 
    end

    def find_path(end_pos) # BFS / DFS 

    end

    def new_move_positions(pos) # itself(pos) will go into @considered
        current_node = @root_node # KnightPathFinder.root_node(start_pos)
        current_valid_moves = KnightPathFinder.valid_moves(pos) 

        children_nodes = current_node.children

        current_valid_moves.each do |next_pos|
            next_node = PolyTreeNode.new(next_pos)
            children_nodes << next_node  # build up [children_nodes]
            next_node.parent = current_node
            current_node.add_child(next_node)
        end
        children_nodes
    end

end

kpf = KnightPathFinder.new

kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]






# 7
# 6             -
# 5
# 4      - 
# 3       -  
# 2   -
# 1    -
# 0 -
# #-0-1-2-3-4-5-6-7