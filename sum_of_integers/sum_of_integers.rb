# SUM OF INTEGERS
# CHALLENGE DESCRIPTION:


# Write a program to determine the largest sum of contiguous integers in a list.

# INPUT SAMPLE:

# The first argument is a path to a filename containing a comma-separated list of integers, one per line.

# For example:

# -10,2,3,-2,0,5,-15
# 2,3,-2,-1,10
# OUTPUT SAMPLE:

# Print to stdout the largest sum. In other words, of all the possible contiguous subarrays for a given array, find the one with the largest sum, and print that sum.

# For example:

# 8
# 12

def solution(line)
  nums = line.split(',').map{|x|x.to_i}
  1.upto(nums.length).inject([]) do |options, i|
    options << nums.each_cons(i).to_a.map{|x| x.inject{|sum, y| sum + y}}.max
  end.max
end

def init(file)
  lines = IO.readlines(file)
  lines.each do |line|
   puts solution line.chomp
  end
end

init(ARGV[0])