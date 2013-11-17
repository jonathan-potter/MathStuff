def merge_sort(array)
  return array if array.length <= 1

  left, right = split_array(array)

  left  = merge_sort(left)
  right = merge_sort(right)

  merge_arrays(left, right)
end

def split_array(array)
  half_index = array.length/2
  [array[0...half_index], array[half_index..-1]]
end

def merge_arrays(left, right)
  return left.empty? ? right : left if left.empty? || right.empty?
  smallest = left[0] < right[0] ? left.shift : right.shift
  merge_arrays(left, right).unshift(smallest)
end

if __FILE__ == $0

  if ARGV[0]
    n = ARGV[0].to_i
  else
    n = 10
  end

  random_array = (1..n).to_a.shuffle
  p random_array
  p merge_sort(random_array)

end