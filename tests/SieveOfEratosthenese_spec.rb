
require_relative '../primes/SieveOfEratosthenes.rb'
require 'rspec'

describe "Sieve of Eratosthenes" do

  it "returns all primes below a given limit" do
    sieve_of_eratosthenes(10).should == [1,2,3,5,7]
  end

end
