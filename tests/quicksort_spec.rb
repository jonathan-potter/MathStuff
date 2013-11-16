
require_relative '../sorting/quick_sort.rb'
require 'rspec'

describe "Quicksort" do
  randomized_array = (1..100).to_a.shuffle

  it "sorts an array" do
    quicksort(randomized_array).should == randomized_array.sort
  end
end
