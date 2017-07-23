# FILE SIZE
# CHALLENGE DESCRIPTION:


# Print the size of a file in bytes.

# INPUT:

# The first argument to your program has the path to the file you need to check the size of.

# OUTPUT SAMPLE:

# Print the size of the file in bytes. E.g.

# 55
def solution file
  File.stat(file).size
end

def init file
  puts solution file
end

init ARGV[0]
