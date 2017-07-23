# FOLLOWING INTEGER
# CHALLENGE DESCRIPTION:

# Credits: This challenge has appeared in a past google competition 

# You are writing out a list of numbers.Your list contains all numbers with exactly Di digits in its decimal representation which are equal to i, for each i between 1 and 9, inclusive. You are writing them out in ascending order. For example, you might be writing every number with two '1's and one '5'. Your list would begin 115, 151, 511, 1015, 1051. Given N, the last number you wrote, compute what the next number in the list will be. The number of 1s, 2s, ..., 9s is fixed but the number of 0s is arbitrary.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each test case will contain an integer n < 10^6. E.g.

# 115
# 842
# 8000
# OUTPUT SAMPLE:

# For each line of input, generate a line of output which is the next integer in the list. E.g.

# 151
# 2048
# 80000
class Following
  def self.find n
    new.find n
  end

  def find n
    c = n.chars.map { |x| x.to_i }
    r = find_next c, n
    r.nil? ? find_next(c.push(0), n) : r
  end

  private

  def find_next c, n
    c.permutation
     .to_a
     .map { |a| a.join.to_i }
     .sort
     .find { |x| x > n.to_i }
  end
end

def init file
  IO.readlines(file).each { |line| puts Following.find line }
end

init ARGV[0]