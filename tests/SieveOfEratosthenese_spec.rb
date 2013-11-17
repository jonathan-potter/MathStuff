
require_relative '../primes/SieveOfEratosthenes.rb'
require 'rspec'

describe "Sieve of Eratosthenes" do

  it "sets non primes to nil" do
    set_non_primes_to_nil((0..9).to_a, 10).should == [0,1,2,3,nil,5,nil,7,nil,nil]
  end

  it "selects only non-nil values from the array" do
    non_nil_values_from_array([nil,1,2,3,nil,5,nil,7,nil,nil]).should == [1,2,3,5,7]
  end

  it "returns all primes below a given limit" do
    sieve_of_eratosthenes(10).should == [1,2,3,5,7]
  end

end
