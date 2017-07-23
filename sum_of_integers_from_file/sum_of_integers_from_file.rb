# SUM OF INTEGERS FROM FILE
# CHALLENGE DESCRIPTION:


# Print out the sum of integers read from a file.

# INPUT SAMPLE:

# The first argument to the program will be a path to a filename containing a positive integer, one per line. E.g.

# 5
# 12
# OUTPUT SAMPLE:

# Print out the sum of all the integers read from the file. E.g.

# 17
def sum_of_digits(file)
  lines = IO.readlines(file)
  lines.inject(0){|sum, i| sum + i.to_i}
end

puts sum_of_digits(ARGV[0])