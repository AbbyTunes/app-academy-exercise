class GraphNode

  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_neighbor(*nodes)
    nodes.each { |node| @neighbors << node }
  end

  def bfs(starting_node, target_value)
  queue = [starting_node]
  visited = []

  until queue.empty?
    node = queue.shift # first out
    unless visited.include?(node)
      return node.value if node.value == target_value
      visited.push(node) # last in
      queue += node.neighbors
    end
  end
  
  return nil
end

end

p a = GraphNode.new('a')
p b = GraphNode.new('b')
p c = GraphNode.new('c')
p d = GraphNode.new('d')
p e = GraphNode.new('e')
p f = GraphNode.new('f')

a.add_neighbor([b, c, e])
c.add_neighbor([b, d])
e.add_neighbor([a])
f.add_neighbor([e])

# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]


p a.bfs(a, "c")
p a.bfs(a, "b")
p a.bfs(a, "f")


