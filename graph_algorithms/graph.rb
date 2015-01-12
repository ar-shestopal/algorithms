class Graph

  attr_accessor :nodes

  def initiaize
    @nodes = []
  end

  def add_edge(node_a, node_b)
    node_a.adjacents << node_b
    node_b.adjacents << node_b
  end
end
