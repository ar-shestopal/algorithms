require 'pry'

class Graph
  attr_accessor :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    @nodes << node
    node.graph = self
  end

  def add_edge(from, to, weght)
    edges << Edge.new(from, to, weght)
  end
end
