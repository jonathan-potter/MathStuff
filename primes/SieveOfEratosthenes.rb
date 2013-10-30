def sieve_of_eratosthenes(limit)
  primes = Array.new(limit).map.with_index { |_,index| index }

  2.upto(limit) do |index|
    number = index
    begin
      number += index
      primes[number] = nil
    end until number > limit
  end

  primes.select { |element| !element.nil? }
end

if __FILE__ == $0
  puts sieve_of_eratosthenes(1000)
end