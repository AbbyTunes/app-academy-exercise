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
        if self.parent 
            self.parent.children.delete(self)
        end

        @parent = new_node    
        self.parent.children << self unless self.parent.nil? 
        self
    end

    def add_child(child_node)
        child_node.parent = self
        @children << child_node unless @children.include?(child_node)
    end

    def remove_child(child_node)
        
        if @children.include?(child_node)
            child_node.parent = nil
            self.children.delete(child_node)
        else
            puts "not my child" # not raise
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.empty?

        self.children.each do |child|
            sub_result = child.dfs(target_value)
            return sub_result if sub_result
            next if sub_result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift 
            if node.value == target_value
                return node
            elsif !node.children.empty? 
                queue += node.children
            end        
        end
        nil
    end

end
