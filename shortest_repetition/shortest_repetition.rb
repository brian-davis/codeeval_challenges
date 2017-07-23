# SHORTEST REPETITION
# CHALLENGE DESCRIPTION:


# Write a program to determine the shortest repetition in a string. 
# A string is said to have period p if it can be formed by concatenating one or more repetitions of another string of length p. For example, the string "xyzxyzxyzxyz" has period 3, since it is formed by 4 repetitions of the string "xyz". It also has periods 6 (two repetitions of "xyzxyz") and 12 (one repetition of "xyzxyzxyzxyz").

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line will contain a string of up to 80 non-blank characters. E.g.

# abcabcabcabc
# bcbcbcbcbcbcbcbcbcbcbcbcbcbc
# dddddddddddddddddddd
# adcdefg
# OUTPUT SAMPLE:

# Print out the smallest period of the input string. E.g.

# 3
# 2
# 1
# 7
def shortest_rep line
  1.upto line.length do |n|
    return n if line.split('').each_slice(n).to_a.uniq.size == 1
  end
end

def init file
  IO.readlines(file).each { |line| puts shortest_rep line.chomp }
end

init ARGV[0]