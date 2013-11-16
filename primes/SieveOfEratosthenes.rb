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
  if ARGV[0]
    p sieve_of_eratosthenes(ARGV[0].to_i)
  else
    p sieve_of_eratosthenes(1000)
  end
end