class Edge
  attr_accessor :from, :to

  def initialize(from, to)
    @from, @to = from, to
  end

  def to_s
    "#{from.to_s} => #{to.to_s} with weight #{weight}"
  end

  protected

  def <=>(other)
    self.weight <=> other.weight
  end

end
