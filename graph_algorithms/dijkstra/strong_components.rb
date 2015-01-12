require_relative 'depth_first_order'

class StrongComponents
 attr_accessor :strong_components

  def initialize(graph)
    @graph = graph
    @visited = {}
    @strong_components = {}
    find_connected
  end

  private

  def find_connected
    counter = 0
    @graph.reverse!
    nodes = DepthFirstOrder.new(@graph).reverse_post_order
    nodes.each do |node|
      next if @visited[node]
      dfs(node, counter)
      counter += 1
    end
  end

  def dfs(node, counter)
    @visited[node] = true
    @strong_components[counter] ||= []
    @strong_components[counter] << node

    node.adjacents.each do |adj_node|
      dfs(adj_node, counter) unless @visited[adj_node]
    end
  end
end
