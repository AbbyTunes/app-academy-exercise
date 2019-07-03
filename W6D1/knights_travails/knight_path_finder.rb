require_relative "poly_tree_node"

class KnightPathFinder

POSSIBLE_MOVES = [
[-2, -1], [-2, 1], [-1, -2], [-1, 2], 
[1, -2], [1, 2], [2, -1], [2, 1]
]

attr_accessor :root_node, :start_pos
    
    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = []
        build_move_tree(start_pos)
    end

    def valid_moves(pos) 
        valid_possible_moves = []
        POSSIBLE_MOVES.each do |step|
            new_pos = move_one_step(pos, step)
            valid_possible_moves << new_pos if new_pos != false
        end
        valid_possible_moves # arr = [ [1, 2], [2, 1] ]
    end

    def move_one_step(pos, step)
        x = pos[0] + step[0]
        y = pos[1] + step[1]
        return new_pos = [x, y] if x >= 0 && x <= 7 && y >= 0 && y <= 7
        false
    end

    def [](pos)
        x, y = pos
        self[x][y] 
    end

    def []=(pos, indices)
        x, y = pos
        self[x][y] = indices
    end

    def build_move_tree(start_pos)
        @root_node = PolyTreeNode.new(start_pos)

        @considered_pos = [] # tracks positons already considered

        nodes = [@root_node] # starts the queue for building the move tree
        until nodes.empty?
            current_node = nodes.shift # grabs first node in queue for processing
            current_pos = current_node.value # grabs the position value from the node
            valid_moves(current_pos).each do |valid_pos| # initiates a loop for each valid position from current position
                next if @considered_pos.include?(valid_pos) # ensures no position is visited twice, move to next position if already visited
                @considered_pos << valid_pos # updates visited positions
                next_node = PolyTreeNode.new(valid_pos)  # creates child node based on possible unvisited moves
                current_node.add_child(next_node) # adds children to current node
                next_node.parent = current_node # updates parent attribute of new children
                nodes << next_node # adds child to queue
            end
        end
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)

        the_path_to(end_node)
    end

    def the_path_to(end_node) 
        nodes_travelled = [] 

        current_node = end_node
        
        until current_node.nil?
            nodes_travelled << current_node.value
            current_node = current_node.parent
        end
        return nodes_travelled.reverse!
    end
end

test = KnightPathFinder.new([0, 0])

p test.find_path([2, 1]) # => [[0, 0], [2, 1]]
p test.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
