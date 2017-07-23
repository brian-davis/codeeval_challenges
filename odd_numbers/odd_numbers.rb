# ODD NUMBERS
# CHALLENGE DESCRIPTION:


# Print the odd numbers from 1 to 99.

# INPUT SAMPLE:

# There is no input for this program.

# OUTPUT SAMPLE:

# Print the odd numbers from 1 to 99, one number per line. 

def solution
  [*1..99].select { |x| x.odd? }
end

def init
  solution.each { |x| puts x }
end

init