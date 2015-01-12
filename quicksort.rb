class QuickSort
  attr_reader :array
  attr_accessor :counter

  def initialize(array)
    @array = array
    @counter = 0
  end

  def sort!(left_index = 0, right_index = array.size - 1)
    if left_index < right_index
      pivot_index = left_index
      new_pivot_index = partition(left_index, right_index, pivot_index)
      sort!(left_index, new_pivot_index - 1)
      sort!(new_pivot_index + 1, right_index)
    end
    array
  end

  def swap!(i, j)
    tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
  end

  def partition(l, r, pivot_index)
    self.counter = self.counter + r - l + 1
    pivot = array[pivot_index]
    i = l + 1
    j = l + 1
     while j <= r
      if array[j] < pivot
        swap!(i, j)
        i = i + 1
      end
      j += 1
    end
    swap!(l, i-1)
    pivot_position = i-1
  end
end


array = [3,5,2,6,8,1,7,4,10,9]

qs = QuickSort.new(array)
qs.sort!
puts qs.array.inspect
puts qs.counter
