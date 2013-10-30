##########################################################################
#
# Programmer: Jonathan Potter
#
##########################################################################
import numpy as np
##########################################################################
# Determine the sum of all prime numbers less than an input number
##########################################################################

def SieveOfAtkin(limit):
  """usage SieveOfAtkin(limit)

  This function returns a list of all primes below a given limit.

  It is an implimentation of the Sieve of Atkin. The primary logic
  is a reimplimentation of the example on Wikipedia.
  en.m.wikipedia/wiki/Sieve_of_Atkin"""

  # calculate and store the square root of the limit
  sqrtLimit = np.int(np.ceil(np.sqrt(limit)));

  # initialize the sieve
  isPrime = [False] * limit;

  # this script considers 1 to be prime. If you don't like it,
  # subtract 1 from the result
  isPrime[1:3] = [True] * 3;

  # impliment the sieve
  for x in range (1,sqrtLimit+1):
    for y in range(1,sqrtLimit+1):

        n = 4 * x**2 + y**2;
        if (n <= limit and (n % 12 == 1 or n % 12 == 5)):
          isPrime[n] = not(isPrime[n]);

        n = 3 * x**2 + y**2;
        if (n <= limit and n % 12 == 7):
          isPrime[n] = not(isPrime[n]);

        n = 3 * x**2 - y**2;
        if (n <= limit and x > y and n % 12 == 11):
          isPrime[n] = not(isPrime[n]);

  # for prime n: ensure that all of the multiples of n^2 are not flagged as prime
  for n in range(5,sqrtLimit+1):
    if isPrime[n]:
      isPrime[n**2::n**2] = [False] * len(isPrime[n**2::n**2]);

  # create array of prime numbers below limit
  primeArray = [];
  for n in range(limit + 1):
    if isPrime[n] == True:
      primeArray.append(n);

  # return the result
  return primeArray;
