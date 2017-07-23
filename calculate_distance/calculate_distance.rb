# CALCULATE DISTANCE
# CHALLENGE DESCRIPTION:


# You have coordinates of 2 points and need to find the distance between them.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# (25, 4) (1, -6)
# (47, 43) (-25, -11)
# All numbers in input are integers between -100 and 100.

# OUTPUT SAMPLE:

# Print results in the following way.

# 26
# 90
# You don't need to round the results you receive. They must be integer numbers.


def solution coords
  x1, y1, x2, y2 = coords.scan(/-*[0-9]+/).map { |n| n.to_i }
  Math.sqrt((x1 - x2).abs**2 + (y1 - y2).abs**2).to_i
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
