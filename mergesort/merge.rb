#meergesort realization which counts number of inversions
class Merge
  attr_accessor :array, :count
  def initialize(file, count)
    @array = read_file(file, count)
    @count = 0
  end

  def merge_sort(array)
    return array if array.size <= 1
    left = merge_sort(array[0, array.size/2])
    right = merge_sort(array[array.size/2, array.size])
    merge(left, right)
  end

  private

  def merge(left, right)
    result = []
    while left.size > 0 && right.size > 0
      if left[0] <= right[0]
        result << left.shift
      else
        self.count += left.size
        result << right.shift
      end
    end
    result.concat(left).concat(right)
  end

  def read_file(file, count)
    array = []
    counter = 0
    File.open(file) do |f|
      while l = f.gets and counter < count
        array << l.to_i
        counter += 1
      end
    end
    array
  end
end


c = Merge.new("IntegerArray.txt", 100000)
array = c.send(:read_file, "IntegerArray.txt", 100000)
puts "Array: #{array.inspect}"
puts  "before sorting: #{array.inspect}"
sorted_array = c.merge_sort(array)
puts "after sorting: #{sorted_array.inspect}"
puts "inversions: #{c.count}"
