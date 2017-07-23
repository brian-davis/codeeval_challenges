# SUM OF DIGITS
# CHALLENGE DESCRIPTION:


# Given a positive integer, find the sum of its constituent digits.

# INPUT SAMPLE:

# The first argument will be a path to a filename containing positive integers, one per line. E.g.

# 23
# 496
# OUTPUT SAMPLE:

# Print to stdout, the sum of the numbers that make up the integer, one per line. E.g.

# 5
# 19
def solution n
  n.to_s.split('').reduce(0) { |a, i| a + i.to_i }
end

def init file
  IO.readlines(file).each { |line| puts solution line.to_i }
end

init ARGV[0]
