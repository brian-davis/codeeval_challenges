# PRIME PALINDROME
# CHALLENGE DESCRIPTION:


# Write a program which determines the largest prime palindrome less than 1000.

# INPUT SAMPLE:

# There is no input for this program.

# OUTPUT SAMPLE:

# Print to stdout the largest prime palindrome less than 1000.

# 929

def solution
  primes = (1..1000).each_with_object([]) do |e, a|
    a << e if a.each_with_object([]) { |i, b| b << i if e % i == 0 }.length < 2
  end
  primes.reverse.find { |i| i.to_s == i.to_s.reverse }
end

puts solution
