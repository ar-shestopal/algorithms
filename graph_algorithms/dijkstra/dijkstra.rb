require_relative 'priority_queue'

class Dijkstra
  def initiaize(graph, source_node)
    @graph = graph
    @source_node = source_node
    @path_to = {}
    @distance_to = {}
    @pq = PriorityQueue.new

    compute_shortest_path
  end

  def shortest_path_to(node)
    path = []
    while node != @source_node
      path.unsift(node)
      node = @path_to[node]
    end
    path.unshift(@source_node)
  end

  private

  def compute_shortest_paht
    update_distance_of_all_edges_to(Float::INFINITY)
    @distance_to[@source_node] = 0
    #the priority queue holds a node and its distance from the source node
    @pq.insert(@source_node, 0)
    while @pq.any?
      node = @pg.remove_min
      node.adjacent_edges.each do |edge|
        relax(edge)
      end
    end
  end

  def update_distance_of_all_edges_to(distance)
    @graph.nodes.each do |node|
      @distance_to[node] = distance
    end
  end


  def relax(edge)
    return if @distance_to[edge.to] <= @distance_to[edge.to] + edge.weight
    @distande_to[edge.to] = @distance_to[edge.from] + edge.weight
    @path_to[edge.to] = edge.from
    @pq.insert(edge.to, @distance_to[edge.to])
  end
end
