# N MOD M
# CHALLENGE DESCRIPTION:


# Given two integers N and M, calculate N Mod M (without using any inbuilt modulus operator).

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains two comma separated positive integers. E.g.

# 20,6
# 2,3
# You may assume M will never be zero.

# OUTPUT SAMPLE:

# Print out the value of N Mod M
# re-implement n % m
def solution line
  n, m = line.split(',').map { |x| x.to_i }
  n - ((n / m) * m)
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
