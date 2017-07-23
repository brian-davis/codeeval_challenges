# FIRST NON-REPEATED CHARACTER
# CHALLENGE DESCRIPTION:


# Write a program which finds the first non-repeated character in a string.

# INPUT SAMPLE:

# The first argument is a path to a file. The file contains strings.

# For example:

# yellow
# tooth
# OUTPUT SAMPLE:

# Print to stdout the first non-repeated character, one per line.

# For example:

# y
# h

def solution line
  characters = line.chars
  characters.find { |c| characters.count(c) == 1 }
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
