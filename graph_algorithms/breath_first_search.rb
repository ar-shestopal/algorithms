# Put unvisited nodes on a queue
# Solves the shortest path problem: Find path from "source" to "target"
# that uses the fewest number of edges
# It's not recursive (like depth first search)
#
# The steps are quite simple:
# * Put s into a FIFO queue and mark it as visited
# * Repeat until the queue is empty:
#   - Remove the least recently added node n
#   - add each of n's unvisited adjacents to the queue and
#     mark them as visited

class BreathFirstSearch
  def initialize(graph, source_node)
    @graph = graph
    @node = source_node
    @visited = {}
    @edge_to = {}

    bfs(source_node)
  end

  def shortest_path_to(node)
    return unless has_path_to?(node)
    path = []

    while node != @node
      path.unshift(node)
      node = @edge_to[node]
    end
    path.unshift(@node)
  end


  private

  def bfs(node)
    # Remember, in the breath first search we always
    # use a queue. In ruby we can represent both
    # queues and stacks as an Array, just by using
    # the correct methods to deal with it. In this case,
    # we use the "shift" method to remove an element
    # from the beginning of the Array
    # First step: Put the source node into a queue and mark it as visited

    queue = []
    queue << node
    @visited[node] = true

    # Second step: Repeat until the queue is empty:
    # - Remove the least recently added node n
    # - add each of n's unvisited adjacents to the queue and mark them as visited
    while queue.any?
      current_node = queue.shift #remove first element
      current_node.adjacents.each do |adjacents_node|
        next if @visited[adjacents_node]
        queue << adjacents_node
        @visited[adjacents_node] = true
        @edge_to[adjacents_node] = current_node
      end
    end
  end

  def has_path_to?(node)
    @visited[node]
  end
end


