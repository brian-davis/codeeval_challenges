# SWAP CASE
# CHALLENGE DESCRIPTION:


# Write a program which swaps letters' case in a sentence. All non-letter characters should remain the same.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# Hello world!
# JavaScript language 1.8
# A letter
# OUTPUT SAMPLE:

# Print results in the following way.

# hELLO WORLD!
# jAVAsCRIPT LANGUAGE 1.8
# a LETTER
# re-implement String#swapcase
def solution line
  line.chars.map { |c| c == c.upcase ? c.downcase : c.upcase }.join
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]