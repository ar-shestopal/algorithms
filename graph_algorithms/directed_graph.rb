class DirectedGraph < Graph

  def add_edge(from, to)
    from.adjacents << to
  end
end
