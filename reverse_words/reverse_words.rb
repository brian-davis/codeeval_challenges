# REVERSE WORDS
# CHALLENGE DESCRIPTION:


# Write a program which reverses the words in an input sentence.

# INPUT SAMPLE:

# The first argument is a file that contains multiple sentences, one per line. Empty lines are also possible.

# For example:

# Hello World
# Hello CodeEval
# OUTPUT SAMPLE:

# Print to stdout each sentence with the reversed words in it, one per line. Empty lines in the input should be ignored. Ensure that there are no trailing empty spaces in each line you print.

# For example:
# World Hello
# CodeEval Hello


def solution line
  words = line.split ' '
  words.map.with_index { |_, i| words[(i + 1) * -1] }.join ' '
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
