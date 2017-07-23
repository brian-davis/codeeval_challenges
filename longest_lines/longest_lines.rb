# LONGEST LINES
# CHALLENGE DESCRIPTION:


# Write a program which reads a file and prints to stdout the specified number of the longest lines that are sorted based on their length in descending order.

# INPUT SAMPLE:

# Your program should accept a path to a file as its first argument. The file contains multiple lines. The first line indicates the number of lines you should output, the other lines are of different length and are presented randomly. You may assume that the input file is formatted correctly and the number in the first line is a valid positive integer.

# For example:

# 2
# Hello World
# CodeEval
# Quick Fox
# A
# San Francisco
# OUTPUT SAMPLE:

# Print out the longest lines limited by specified number and sorted by their length in descending order.

# For example:


# San Francisco
# Hello World

def solution lines
  n = lines.shift.to_i
  lines.sort_by { |l| l.length }.reverse.first n
end

def init file
  lines = IO.readlines file
  puts solution lines
end

init ARGV[0]
