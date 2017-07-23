# ARMSTRONG NUMBERS
# CHALLENGE DESCRIPTION:


# An Armstrong number is an n-digit number that is equal to the sum of the n'th powers of its digits. Determine if the input numbers are Armstrong numbers.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file has a positive integer. E.g.

# 6
# 153
# 351
# OUTPUT SAMPLE:

# Print out True/False if the number is an Armstrong number or not. E.g.

# True
# True
# False

def solution n
  digits = n.to_s.chars.to_a
  sum = digits.reduce(0) { |a, e| a + e.to_i**digits.size }
  n == sum
end

def init file
  IO.readlines(file).each { |line| puts solution(line.to_i).to_s.capitalize }
end

init ARGV[0]
