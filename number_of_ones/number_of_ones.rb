# NUMBER OF ONES
# CHALLENGE DESCRIPTION:


# Write a program which determines the number of 1 bits in the internal representation of a given integer.

# INPUT SAMPLE:

# The first argument is a path to a file. The file contains integers, one per line.

# For example:

# 10
# 22
# 56
# OUTPUT SAMPLE:

# Print to stdout the number of ones in the binary form of each number.

# For example:

# 2
# 3
# 3
# SUBMIT SOLUTION

def solution line
  line.to_i.to_s(2).chars.count '1'
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]