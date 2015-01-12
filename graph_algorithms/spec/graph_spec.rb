require 'rspec'

require_relative '../graph'
require_relative '../node'
require_relative '../directed_graph'
require_relative '../breath_first_search'
require_relative '../connected_component'
require_relative '../topological_sort'

describe Graph do
  before(:each) do
    @node1 = Node.new("Node #1")
    @node2 = Node.new("Node #2")
    @node3 = Node.new("Node #3")
    @node4 = Node.new("Node #4")
    @node5 = Node.new("Node #5")
  end

  context "Breath First Search" do
    it "should find the shortest path" do
      graph = Graph.new
      graph.add_edge(@node1, @node2)
      graph.add_edge(@node2, @node3)
      graph.add_edge(@node2, @node4)
      graph.add_edge(@node4, @node5)
      graph.add_edge(@node1, @node5)


      path = BreathFirstSearch.new(@graph, @node1).shortest_path_to(@node5)
      expect(path).to eq [@node1, @node5]
    end
  end

  context "Connected components" do
    it "should find connected components" do
      graph = Graph.new
      graph.nodes = [@node1, @node2, @node3, @node4, @node5]
      graph.add_edge(@node1, @node2)
      graph.add_edge(@node3, @node4)

      connected_components = ConnectedComponent.new(graph).connected_components.values
      expect(connected_components).to include [@node1, @node2]
      expect(connected_components).to include [@node3, @node4]
      expect(connected_components).to include [@node5]
    end
  end

  context "Topological search" do
    it "order nodes" do
      graph = DirectedGraph.new
      graph.nodes = [@node1, @node2, @node3, @node4, @node5]
      graph.add_edge(@node1, @node2)
      graph.add_edge(@node1, @node5)
      graph.add_edge(@node2, @node3)
      graph.add_edge(@node2, @node4)
      result = TopologicalSort.new(graph).order

      expect(result).to eq [@node3, @node4, @node2, @node5, @node1]
    end
  end
end
