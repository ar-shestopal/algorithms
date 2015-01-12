class TopologicalSort
  attr_accessor :order

  def initialize(graph)
    @order = []
    @visited = {}

    graph.nodes.each do |node|
      dfs(node) unless @visited[node]
    end
  end

  private

  def dfs(node)
    @visited[node] = true
    node.adjacents.each do |adj_node|
      dfs(adj_node) unless @visited[adj_node]
    end

    @order << node
  end
end
