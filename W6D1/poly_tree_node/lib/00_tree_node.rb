class PolyTreeNode

    attr_reader :value, :parent, :children
    attr_writer :children, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_node)
        
        return if self.parent == new_node

        if self.parent # => truthy || not nil 
            self.parent.children.delete(self) # delete myself from my parent's children array
        end

        @parent = new_node # new_node can be nil 
        self.parent.children << self unless self.parent.nil? 
        # self
    end

    def add_child(child_node)
        child_node.parent = self
        @children << child_node unless @children.include?(child_node)
    end

    def remove_child(child_node)
        
        if @children.include?(child_node)
            child_node.parent = nil  # remove parent from the child_node
            self.children.delete(child_node)
        else
            raise "not my child"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.empty?

        self.children.each do |child|
            sub_result = child.dfs(target_value) # slack
            # if return here, once it hit the bottom leave the first time, it will return nil back up, stop searching

            return sub_result if sub_result # when not nil, means the target_value is found, we carry that node as a result
            # next if sub_result.nil? # => not necessary, b/c code will go to the next iteration
        end
        nil # everytime before return the sub_result, will carry nil back up
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift   # queue[0], delete
            if node.value == target_value  # 1/2
                return node
            elsif !node.children.empty? # 1/4 this node has children
                queue += node.children
            end        
        end
        nil
    end

end
