# FIBONACCI SERIES
# CHALLENGE DESCRIPTION:


# The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n–1) + F(n–2) when n>1. Given an integer n≥0, print out the F(n).

# INPUT SAMPLE:

# The first argument will be a path to a filename containing integer numbers, one per line. E.g.

# 5
# 12
# OUTPUT SAMPLE:

# Print to stdout, the fibonacci number, F(n). E.g.

# 5
# 144

def solution n
  return 0 if n == 0
  f = [0, 1]
  f << f[-1] + f[-2] until f.size == n + 1
  f.last
end

def init file
  lines = IO.readlines file
  lines.each do |line|
    puts solution line.to_i
  end
end

init ARGV[0]
