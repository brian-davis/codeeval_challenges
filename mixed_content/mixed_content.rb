# MIXED CONTENT
# CHALLENGE DESCRIPTION:


# You have a string of words and digits divided by comma. Write a program which separates words with digits. You shouldn't change the order elements.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# 8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21
# 24,13,14,43,41
# OUTPUT SAMPLE:

# melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21
# 24,13,14,43,41
# As you cas see you need to output the same input string if it has words only or digits only.


def solution line
  words = line.scan(/[a-zA-Z]+/).join(',')
  numbers = line.scan(/[0-9]+/).join(',')
  [words, numbers].join('|').gsub(/^\||\|$/, '')
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]