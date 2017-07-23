# STRING PERMUTATIONS
# SPONSORING COMPANY:

# CHALLENGE DESCRIPTION:

# Write a program which prints all the permutations of a string in alphabetical order. We consider that digits < upper case letters < lower case letters. The sorting should be performed in ascending order.

# INPUT SAMPLE:

# Your program should accept a file as its first argument. The file contains input strings, one per line.

# For example:

# hat
# abc
# Zu6
# OUTPUT SAMPLE:

# Print to stdout the permutations of the string separated by comma, in alphabetical order.

# For example:

# aht,ath,hat,hta,tah,tha
# abc,acb,bac,bca,cab,cba
# 6Zu,6uZ,Z6u,Zu6,u6Z,uZ6

def solution line
  line.split('')
      .permutation
      .each_with_object([]) { |e, a| a << e.join }
      .sort
      .join ','
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]