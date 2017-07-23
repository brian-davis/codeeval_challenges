# CAPITALIZE WORDS
# CHALLENGE DESCRIPTION:


# Write a program which capitalizes the first letter of each word in a sentence.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# Hello world
# javaScript language
# a letter
# 1st thing
# OUTPUT SAMPLE:

# Print capitalized words in the following way.

# Hello World
# JavaScript Language
# A Letter
# 1st Thing
# SUBMIT SOLUTION
def solution str
  str.split(' ').map do |w|
    letters = w.chars.to_a
    letters.unshift(letters.shift.upcase).join
  end.join ' '
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
