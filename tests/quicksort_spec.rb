
require_relative '../sorting/quick_sort.rb'
require 'rspec'

describe "Quicksort" do
  randomized_array = (1..100).to_a.shuffle

  it "builds a tree" do
    build_quicksort_tree( 2, nil).should == {value: 2}
    build_quicksort_tree( 1, {value: 2}).should == {value: 2, left:  {value: 1}}
    build_quicksort_tree( 3, {value: 2}).should == {value: 2, right: {value: 3}}
  end

  it "deconstructs a tree" do
    deconstruct_quicksort_tree({value: 2}).should == [2]
    deconstruct_quicksort_tree({value: 2, left:  {value: 1}}).should == [1, 2]
    deconstruct_quicksort_tree({value: 2, right: {value: 3}}).should == [2, 3]
  end

  it "sorts an array" do
    quicksort(randomized_array).should == randomized_array.sort
  end
end
