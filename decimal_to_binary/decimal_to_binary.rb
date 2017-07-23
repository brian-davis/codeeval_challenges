# DECIMAL TO BINARY
# CHALLENGE DESCRIPTION:


# You are given a decimal (base 10) number, print its binary representation.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename containing decimal numbers greater or equal to 0, one per line.

# Ignore all empty lines.

# For example:

# 2
# 10
# 67
# OUTPUT SAMPLE:

# Print the binary representation, one per line.

# For example:

# 10
# 1010
# 1000011



# reimplement line.to_i.to_s(n)
def solution n
  q, r = n.divmod 2
  bits = []
  until q == 0
    bits << r
    n = q
    q, r = n.divmod 2
  end
  bits << r
  bits.reverse.join
end

def init file
  IO.readlines(file).each { |line| puts solution line.to_i }
end

init ARGV[0]