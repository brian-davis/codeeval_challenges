# QUERY BOARD
# CHALLENGE DESCRIPTION:


# There is a board (matrix). Every cell of the board contains one integer, which is 0 initially.

# The next operations can be applied to the Query Board:
# SetRow i x: it means that all values in the cells on row "i" have been changed to value "x" after this operation.
# SetCol j x: it means that all values in the cells on column "j" have been changed to value "x" after this operation.
# QueryRow i: it means that you should output the sum of values on row "i".
# QueryCol j: it means that you should output the sum of values on column "j".

# The board's dimensions are 256x256
# "i" and "j" are integers from 0 to 255
# "x" is an integer from 0 to 31
# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains an operation of a query. E.g.

# SetCol 32 20
# SetRow 15 7
# SetRow 16 31
# QueryCol 32
# SetCol 2 14
# QueryRow 10
# SetCol 14 0
# QueryRow 15
# SetRow 10 1
# QueryCol 2
# OUTPUT SAMPLE:

# For each query, output the answer of the query. E.g.

# 5118
# 34
# 1792
# 3571


class Matrix
  attr_reader :matrix

  def initialize
    @matrix = Array.new(256) { Array.new(256, 0) }
  end

  def set_col x, val
    @matrix = @matrix.transpose
    @matrix[x].map! { |_e| val }
    @matrix = @matrix.transpose
  end

  def set_row y, val
    @matrix[y].map! { |_e| val }
  end

  def get_col x
    @matrix.transpose[x]
  end

  def get_row y
    @matrix[y]
  end

  def query_row y
    r = get_row(y).reduce(&:+)
    puts r
    r
  end

  def query_col x
    r = get_col(x).reduce(&:+)
    puts r
    r
  end

  def method_missing method, *args
    send(snake_case(method.to_s).to_sym, *args)
  end

  private

  def snake_case str
    str.scan(/[A-Z][a-z]+/).map(&:downcase).join('_')
  end
end

def run
  data = $stdin.read
               .split("\n")
               .map! { |line| line.split(' ') }

  m = Matrix.new
  data.each do |line|
    method = line[0]
    args = line[1..-1].map(&:to_i)
    m.send(method, *args)
  end
end

run
