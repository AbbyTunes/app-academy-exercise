require_relative "poly_tree_node"

class KnightPathFinder

POSSIBLE_MOVES = [
[-2, -1], [-2, 1], [-1, -2], [-1, 2], 
[1, -2], [1, 2], [2, -1], [2, 1]
]
    
    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        @root_node = KnightPathFinder.root_node(start_pos)
        build_move_tree
    end

    def self.root_node(start_pos)
        PolyTreeNode.new(start_pos) 
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
        self.root_node = PolyTreeNode.new(start_pos)

        @considered_pos = [] # tracks positons already considered

        nodes = [root_node] # starts the queue for building the move tree
        until nodes.empty?
            current_node = nodes.shift # grabs first node in queue for processing
            current_pos = current_node.value # grabs the position value from the node
            valid_moves(current_pos).each do |valid_pos| # initiates a loop for each valid position from current position
                next if @considered_pos.include?(valid_pos) # ensures no position is visited twice, move to next position if already visited
                @considered_pos << valid_pos # updates visited positions
                next_node = PolyTreeNode.new(valid_pos)  # creates child node based on possible unvisited moves
                current_node.add_children(next_node) # adds children to current node
                next_node.parent = current_node # updates parent attribute of new children
                nodes << next_node # adds child to queue
            end
        end
    end
    end
    
        def build_move_tree(end_pos)
        current_pos = @start_pos
        current_node = KnightPathFinder.root_node(start_pos)
        current_valid_pos = KnightPathFinder.valid_moves(current_pos) 

        node_queue = [current_node]  
        until node_queue.empty?
            current_node = node_queue.shift
            if current_node.value == end_pos
                return current_node
            elsif !current_node.children.empty?
                queue += build_children_nodes(current_pos, current_valid_pos) 
            end
        end
        nil

    end

    def build_children_nodes(pos, current_valid_moves)

        children_nodes = []
        
        current_valid_moves.each do |each_pos|
            children_nodes << KnightPathFinder.root_node(each_pos)
            next_child_node.parent = current_node
            start_node.add_child(next_child_node)
        end
        children_nodes
    end




    def find_path(end_pos) # BFS / DFS 
    end


    def build_move_tree
        current_pos = @start_pos
        current_node = KnightPathFinder.root_node(start_pos)
        
        current_valid_moves = KnightPathFinder.valid_moves(current_pos) 
        # => [possible_positions]

        node_queue = [current_node]


        node_queue += build_children_nodes(pos, current_valid_moves) 

        until node_queue.empty?
            current_node = node_queue.shift
            if current_node.value == (end_pos)
                return current_node
            elsif !current_node.children.empty?
                queue += current_node.children
            end
        end
        nil

    end

    def build_children_nodes(pos, current_valid_moves)


        
        children_nodes = []
        
        current_valid_moves.each do |each_pos|
            children_nodes << KnightPathFinder.root_node(each_pos)
            next_child_node.parent = current_node
            start_node.add_child(next_child_node)
        end
        children_nodes

    end

end

# test_case = KnightPathFinder.new([0, 0])


# kpf = KnightPathFinder.new

# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

        # 1) KnightPathFinder.root_node(start_pos)
        # KnightPathFinder.root_node(each_child_pos)

        # 2) iterate through "valid_moves(start_pos)" => an array of positions
        #     - each position, call root_node, to create "children node"
        #     - connect parent and children nodes (method: parent=, add_child)
        #     - return children_node_arr




# 7
# 6             -
# 5
# 4      - 
# 3       -  
# 2   -
# 1    -
# 0 -
# #-0-1-2-3-4-5-6-7