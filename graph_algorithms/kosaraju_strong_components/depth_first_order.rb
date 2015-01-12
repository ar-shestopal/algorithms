class DepthFirstOrder
  attr_accessor :reverse_post_order, :visited

  def initialize(graph)
    @graph = graph
    @reverse_post_order = []
    @visited = {}
    form_reverse_order
  end

  private

  def form_reverse_order
    @graph.nodes.each do |node|
      dfs(node) unless @visited[node]
    end
    p @reverse_post_order.map(&:to_s)
  end

  def dfs(node)
    @visited[node] = true
    node.adjacents.each do |adj_node|
      dfs(adj_node) unless @visited[adj_node]
    end

    @reverse_post_order << node
  end
end
