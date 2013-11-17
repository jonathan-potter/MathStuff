
require_relative '../sorting/merge_sort.rb'
require 'rspec'

describe "Mergesort" do

  randomized_array = (1..100).to_a.shuffle

  it "splits an array in half" do
    split_array([1,2,3,4,5,6]).should == [[1,2,3], [4,5,6]]
    split_array([1,2,3,4,5]).should   == [[1,2],   [3,4,5]]
  end

  it "merges two sorted arrays into a sorted array" do
    merge_arrays([1,3,5], [2,4,6]).should          == [1,2,3,4,5,6]
    merge_arrays([1,2,3,4,5], [6,7,8,9,10]).should == [1,2,3,4,5,6,7,8,9,10]
  end

  it "sorts an array" do
    merge_sort(randomized_array).should == randomized_array.sort
  end

end