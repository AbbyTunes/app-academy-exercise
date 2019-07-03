class GraphNode

  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def neighbor=(*nodes)
    nodes.each { |node| @neighbors << node }
    # @neighbors += nodes
  end

end

def bfs(starting_node, target_value)
  queue = [starting_node]
  visited = []

  until queue.empty?
    node = queue.shift  # first out
    unless visited.include?(node)
      return node.value if node.value == target_value
      visited.push(node)  # last in
      queue += node.neighbors
    end
  end
  return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

# a.add_neighbor([b, c, e])
# c.add_neighbor([b, d])
# e.add_neighbor([a])
# f.add_neighbor([e])

a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]


p bfs(a, "c")
p bfs(a, "b")
p bfs(a, "f")


