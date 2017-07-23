# COMPRESSED SEQUENCE
# CHALLENGE DESCRIPTION:

# Assume that someone dictates you a sequence of numbers, and you need to write it down. For brevity, he dictates it as follows: first he dictates the number of consecutive identical numbers, and then - the number itself.

# For example:
# The sequence below

# 1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2
# is dictated as follows:

# two times one, three times three, four times two, three times fourteen, three times eleven, one time two
# and you have to write down the sequence

# 2 1 3 3 4 2 3 14 3 11 1 2
# Your task is to write a program that compresses a given sequence using this approach.

# INPUT SAMPLE:

# Your program should accept a path to a file as its first argument that contains T number of lines. Each line is a test case represented by a sequence of integers with the length L, where each integer is N separated by a space.


# 40 40 40 40 29 29 29 29 29 29 29 29 57 57 92 92 92 92 92 86 86 86 
# 86 86 86 86 86 86 86
# 73 73 73 73 41 41 41 41 41 41 41 41 41 41
# 1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2
# 7
# OUTPUT SAMPLE:

# For each test case, print out a compressed sequence of numbers separated by a single space, one per line.
def compress str
  numbers = str.split ' '
  count = 1
  numbers.each_index.with_object([]) do |i, a|
    if numbers[i] == numbers[i + 1]
      count += 1
    else
      a << [count, numbers[i]]
      count = 1
    end
  end.flatten.join ' '
end

def init file
  IO.readlines(file).each { |line| puts compress line.chomp }
end

init ARGV[0]
