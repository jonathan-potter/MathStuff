def merge_sort(array)
  return array if array.length <= 1

  half_index = array.length/2

  # sort the first and second half of the given array individually
  first_half =  merge_sort(array[0...half_index])
  second_half = merge_sort(array[half_index..-1])

  # merge the two sorted arrays
  sorted_array = []
  while first_half.length > 0 and second_half.length > 0
    if first_half[0] < second_half[0]
      sorted_array << first_half.shift
    else
      sorted_array << second_half.shift
    end
  end

  # add the remaining elements to the end of the array
  sorted_array = sorted_array + first_half
  sorted_array = sorted_array + second_half
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