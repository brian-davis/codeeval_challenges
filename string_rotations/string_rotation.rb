# STRING ROTATION
# CHALLENGE DESCRIPTION:

# You are given two strings. Determine if the second string is a rotation of the first string.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains two comma separated strings. E.g.

# Hello,lloHe
# Basefont,tBasefon
# OUTPUT SAMPLE:

# Print out True/False if the second string is a rotation of the first. E.g.

# True
# True
def solution line
  original, comparison = line.chomp.split(',').map { |p| p.chars.to_a }
  comparison.length.times do
    return "True" if original == comparison
    comparison.rotate!
  end
  "False"
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
