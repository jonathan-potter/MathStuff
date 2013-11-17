def sieve_of_eratosthenes(limit)
  primes = (0...limit).to_a

  primes[0] = nil
  primes = set_non_primes_to_nil(primes, limit)
  non_nil_values_from_array(primes)
end

def set_non_primes_to_nil(array, limit)
  (2...limit).to_a.each do |index|
    number = index
    while number < limit
      number += index
      array[number] = nil if number < limit
    end
  end

  array
end

def non_nil_values_from_array(array)
  array.select { |element| !element.nil? }
end

if __FILE__ == $0
  if ARGV[0]
    p sieve_of_eratosthenes(ARGV[0].to_i)
  else
    p sieve_of_eratosthenes(1000)
  end
end