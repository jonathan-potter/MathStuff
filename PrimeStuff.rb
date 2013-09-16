

module MathStuff

  # Sieve of Eratosthenes
  def primes_below_limit(limit)
    primes = Array.new(limit).map.with_index { |t,i| i }

    2.upto(limit) do |index|
      number = index
      begin
        number += index
        primes[number] = nil
      end until number > limit
    end

    primes.select { |element| !element.nil? }
  end

end

if __FILE__ == $0
  p primes_below_limit(1000)
end