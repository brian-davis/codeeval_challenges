# STACK IMPLEMENTATION
# CHALLENGE DESCRIPTION:


# Write a program which implements a stack interface for integers. The interface should have ‘push’ and ‘pop’ functions. Your task is to ‘push’ a series of integers and then ‘pop’ and print every alternate integer.

# INPUT SAMPLE:

# Your program should accept a file as its first argument. The file contains a series of space delimited integers, one per line.

# For example:


# 1 2 3 4
# 10 -2 3 4
# OUTPUT SAMPLE:

# Print to stdout every alternate space delimited integer, one per line.

# For example:


# 4 2
# 4 -2

def solution(line)
  s = []
  line.split(' ').each { |n| s.push n.to_i }
  (1..s.size).each.with_object([]) do |i, a|
    x = s.pop
    a << x if i.odd?
  end.join(' ')
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]