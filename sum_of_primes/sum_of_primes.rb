# SUM OF PRIMES
# CHALLENGE DESCRIPTION:

# Write a program which determines the sum of the first 1000 prime numbers.

# INPUT SAMPLE:

# There is no input for this program.

# OUTPUT SAMPLE:

# Print to stdout the sum of the first 1000 prime numbers.

# 3682913

def sum_of_primes
  primes, n = [], 2
  until primes.size == 1000
    divisors = []
    1.upto(n) do |i|
      divisors << i if n % i == 0
      break if divisors.size > 2
    end
    primes << n if divisors.size == 2
    n += 1
  end
  primes.reduce :+
end

puts sum_of_primes
