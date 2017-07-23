# EVEN NUMBERS
# CHALLENGE DESCRIPTION:


# Write a program which checks input numbers and determines whether a number is even or not.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# 701
# 4123
# 2936
# OUTPUT SAMPLE:

# Print 1 if the number is even or 0 if the number is odd.

# 0
# 0
# 1
# All numbers in input are integers > 0 and < 5000.

def even_numbers n
  n.even? ? 1 : 0
  # n % 2 == 0 ? 1 : 0
end

def init file
  IO.readlines(file).each { |line| puts even_numbers line.to_i }
end

init ARGV[0]
