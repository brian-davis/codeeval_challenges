# KNIGHT MOVES
# CHALLENGE DESCRIPTION:

# In chess, the knight moves to any of the closest squares that are not on the same rank, file, or diagonal. Thus the move is in the “L” form: two squares vertically and one square horizontally, or two squares horizontally and one square vertically:


# Your task is to find all possible positions for the next move of the knight on the empty chessboard.

# INPUT SAMPLE:

# The first argument is a filename that contains positions of the knight on the chessboard in the CN form, where:

# C is a letter from “a” to “h” and denotes a column.
# N is a number from 1 to 8 and denotes a row.
# Each position is indicated in a new line.

# For example:

# g2
# a1
# d6
# e5
# b1
# OUTPUT SAMPLE:

# Print to stdout all possible positions for the next move of the knight ordered alphabetically.

# For example:

# e1 e3 f4 h4
# b3 c2
# b5 b7 c4 c8 e4 e8 f5 f7
# c4 c6 d3 d7 f3 f7 g4 g6
# a3 c3 d2
# CONSTRAINTS:

# The number of test cases is 40.

class ChessBoard
  X_COORDS     = %w(a b c d e f g h)
  Y_COORDS     = %w(1 2 3 4 5 6 7 8).reverse
  KNIGHT_MOVES = [:two_up_one_left,
                  :two_up_one_right,
                  :two_right_one_up,
                  :two_right_one_down,
                  :two_down_one_left,
                  :two_down_one_right,
                  :two_left_one_up,
                  :two_left_one_down]

  attr_accessor :board

  def initialize
    @board = make_board
    @knight_position = []
  end

  def knight_moves position
    place_knight position
    KNIGHT_MOVES.map { |move| self.send move, *@knight_position }
                .compact
                .select { |m| m.length == 2 }
                .sort
  end

  private

  def place_knight position
    x, y = position.split(//)
    @knight_position = [X_COORDS.index(x), Y_COORDS.index(y)]
    @board[@knight_position[1]][@knight_position[0]] = 'K'
  end

  def make_board
    Array.new(8) { Array.new 8 }
  end

  def target_square target_x, target_y
    if target_y >= 0 && target_x >= 0
      [X_COORDS[target_x], Y_COORDS[target_y]].join
    end
  end

  def two_up_one_left x, y
    target_square(x - 1, y - 2)
  end

  def two_up_one_right x, y
    target_square x + 1, y - 2
  end

  def two_right_one_up x, y
    target_square x + 2, y - 1
  end

  def two_right_one_down x, y
    target_square x + 2, y + 1
  end

  def two_down_one_left x, y
    target_square x - 1, y + 2
  end

  def two_down_one_right x, y
    target_square x + 1, y + 2
  end

  def two_left_one_up x, y
    target_square x - 2, y - 1
  end

  def two_left_one_down x, y
    target_square x - 2, y + 1
  end
end

$stdin.read.split("\n").each { |line| puts ChessBoard.new.knight_moves(line).join(' ') }
