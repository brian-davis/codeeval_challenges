# MINESWEEPER
# CHALLENGE DESCRIPTION:

# You will be given an M*N matrix. Each item in this matrix is either a '*' or a '.'. A '*' indicates a mine whereas a '.' does not. The objective of the challenge is to output a M*N matrix where each element contains a number (except the positions which actually contain a mine which will remain as '*') which indicates the number of mines adjacent to it. Notice that each position has at most 8 adjacent positions e.g. left, top left, top, top right, right, ...

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains M,N, a semicolon and the M*N matrix in row major form. E.g.

# 3,5;**.........*...
# 4,4;*........*......
# OUTPUT SAMPLE:

# Print out the new M*N matrix (in row major form) with each position(except the ones with the mines) indicating how many adjacent mines are there. E.g.

# **100332001*100
# *10022101*101110
class Minesweeper
  def initialize line
    dims, vals = line.split ';'
    _x, y = dims.split(',').map { |x| x.to_i }
    @board = vals.chars.each_slice(y).to_a
  end

  def solution
    @board.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        cell == '*' ? cell : mine_count(x, y)
      end
    end.flatten.join
  end

  private

  def minus v
    v - 1 < 0 ? nil : v - 1
  end

  def mine_count x, y
    a_l = @board[minus(x)][minus(y)] rescue nil
    a_c = @board[minus(x)][y]        rescue nil
    a_r = @board[minus(x)][y + 1]    rescue nil
    l   = @board[x][minus(y)]        rescue nil
    r   = @board[x][y + 1]           rescue nil
    b_l = @board[x + 1][minus y]     rescue nil
    b_c = @board[x + 1][y]           rescue nil
    b_r = @board[x + 1][y + 1]       rescue nil
    [a_l, a_c, a_r, l, r, b_l, b_c, b_r].count { |cell| cell == '*' }
  end
end

def init file
  IO.readlines(file).each { |line| puts Minesweeper.new(line.chomp).solution }
end

init ARGV[0]
