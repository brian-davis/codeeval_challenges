# REVERSE GROUPS
# SPONSORING COMPANY:

# CHALLENGE DESCRIPTION:


# Given a list of numbers and a positive integer k, reverse the elements of the list, k items at a time. If the number of elements is not a multiple of k, then the remaining items in the end should be left as is.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains a list of numbers and the number k, separated by a semicolon. The list of numbers are comma delimited. E.g.

# 1,2,3,4,5;2
# 1,2,3,4,5;3
# OUTPUT SAMPLE:

# Print out the new comma separated list of numbers obtained after reversing. E.g.

# 2,1,4,3,5
# 3,2,1,4,5
def solution line
  arr, group_size = line.split(';').map { |p| p.split(',').map { |x| x.to_i } }
  slices = arr.each_slice(group_size.first).to_a
  if slices.last.size == slices.first.size
    slices.map { |slice| slice.reverse }
  else
    final_slice = slices.pop
    slices.map { |slice| slice.reverse } << final_slice
  end.flatten.join(',')
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]