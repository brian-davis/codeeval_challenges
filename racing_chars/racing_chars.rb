# RACING CHARS
# CHALLENGE DESCRIPTION:

# You are given a file where each line is a section of a race track with obstructions, gates, and checkpoints. Your task is to find a way to pass this track using the following information:

# 1. Each section contains either one single gate or one gate with a checkpoint. 
# 2. You should drive only through gates or checkpoints. 
# 3. You should drive through a checkpoint rather than a gate. 
# 4. An obstruction is represented by a number sign "#". 
# 5. A gate is represented by an underscore "_". 
# 6. A checkpoint is represented by a letter C.

# INPUT SAMPLE:

# Your program should accept a path to a filename as its first argument. Each line of the file is a new section of a race track.


# 
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# #########_##
# ########C_##
# #######_####
# ######_#C###
# #######_C###
# #######_####
# ######C#_###
# ######C_####
# #######_####
# #######_####
# OUTPUT SAMPLE:

# Print out the way of passing this race track starting from the first line in the file. Use a pipe "|" for the straight, use a slash "/" for the left turn, and use a backslash "\" for the right turn.


# 
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# #########|##
# ########/_##
# #######/####
# ######_#\###
# #######_|###
# #######/####
# ######/#_###
# ######|_####
# #######\####
# #######|####
# CONSTRAINTS:

# The number of lines in a file is 50.
# The width of a section is 12 characters
class RacingChars
  def initialize lines
    @lines = lines
  end

  attr_reader :lines

  def solution
    lines.first['_'] = '|'
    lines.each_index.with_object([]) do |i, a|
      current_line, next_line = lines[i], lines[i + 1]
      current_position = current_line.index(/\/|\||\\/)
      left_path = next_line ? next_line[current_position - 1] : nil
      center_path = next_line ? next_line[current_position] : nil
      right_path = next_line ? next_line[current_position + 1] : nil

      if left_path == 'C'
        next_line['C'] = '/'
      elsif center_path == 'C'
        next_line['C'] = '|'
      elsif right_path == 'C'
        next_line['C'] = '\\'
      elsif left_path == '_'
        next_line['_'] = '/'
      elsif center_path == '_'
        next_line['_'] = '|'
      elsif right_path == '_'
        next_line['_'] = '\\'
      end

      a << current_line
    end
  end
end

def init file
  puts RacingChars.new(IO.readlines file).solution
end

init ARGV[0]
