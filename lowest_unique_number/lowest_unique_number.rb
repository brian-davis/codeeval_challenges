# LOWEST UNIQUE NUMBER
# CHALLENGE DESCRIPTION:


# There is a game where each player picks a number from 1 to 9, writes it on a paper and gives to a guide. A player wins if his number is the lowest unique. We may have 10-20 players in our game.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename.

# You're a guide and you're given a set of numbers from players for the round of game. E.g. 2 rounds of the game look this way:

# 3 3 9 1 6 5 8 1 5 3
# 9 2 9 9 1 8 8 8 2 1 1
# OUTPUT SAMPLE:

# Print a winner's position or 0 in case there is no winner. In the first line of input sample the lowest unique number is 6. So player 5 wins.

# 5
# 0
def solution line
  n = line.split(' ').map { |i| i.to_i }
  l = n.each_with_object([]) { |e, a| a << e if n.count(e) == 1 }.min
  n.index(l) + 1
  rescue
    0
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
