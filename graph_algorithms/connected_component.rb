class ConnectedComponent
  attr_accessor :connected_components

  def initialize(graph)
    @graph = graph
    @visited = {}
    @connected_components = {}
    find_connected
  end

  private

  def find_connected
    counter = 0
    @graph.nodes.each do |node|
      next if @visited[node]
      dfs(node, counter)
      counter += 1
    end
  end

  def dfs(node, counter)
    @visited[node] = true
    @connected_components[counter] ||= []
    @connected_components[counter] << node

    node.adjacents.each do |adj_node|
      dfs(adj_node, counter) unless @visited[adj_node]
    end
  end
end
