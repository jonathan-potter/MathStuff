# naive implementation of quicksort. pivot is the first value in the array

def quicksort(array)
  tree = nil

  array.each do |element|
    tree = build_quicksort_tree( element, tree )
  end

  deconstruct_quicksort_tree(tree)
end

def build_quicksort_tree( value, tree = {} )
  return { value: value } if tree.nil?

  if value < tree[:value]
    tree[:left]  = build_quicksort_tree( value, tree[:left] )
  else
    tree[:right] = build_quicksort_tree( value, tree[:right] )
  end

  tree
end

def deconstruct_quicksort_tree(tree)
  array = []

  array = array + deconstruct_quicksort_tree(tree[:left])  if tree[:left]
  array = array + [tree[:value]]
  array = array + deconstruct_quicksort_tree(tree[:right]) if tree[:right]

  array
end

if __FILE__ == $0

  if ARGV[0]
    n = ARGV[0].to_i
  else
    n = 10
  end

  random_array = (1..n).to_a.shuffle
  p random_array
  p quicksort(random_array)

end