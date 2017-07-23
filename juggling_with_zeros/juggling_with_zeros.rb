# JUGGLING WITH ZEROS
# CHALLENGE DESCRIPTION:

# In this challenge, you will deal with zero-based numbers. A zero-based number has the following form: "flag" "sequence of zeroes" "flag" "sequence of zeroes", and so on. The numbers are separated by a single space.

# 00 0 0 00 00 0
# You have to convert zero-based numbers into integers. To do this, you need to perform the following steps:

# Convert a zero-based number into a binary form using the following rules:
# a) flag "0" means that the following sequence of zeroes should be appended to a binary string.

# b) flag "00" means that the following sequence of zeroes should be transformed into a sequence of ones and be appended to a binary string.

# 00 0 0 00 00 0 --> 1001
# Convert the obtained binary string into an integer.
# 1001 --> 9
# INPUT SAMPLE:

# The first argument is a file where each line of input contains a string with zero-based number.

# For example:

# 4
# 00 0 0 00 00 0
# 00 0
# 00 0 0 000 00 0000000 0 000
# 0 000000000 00 00
# OUTPUT SAMPLE:

# For each line of input, print an integer converted from a zero-based number.

# For example:

# 4
# 9
# 1
# 9208
# 3


class Array
  def unzip
    group_by.with_index { |_e, i| i.even? }.values
  end
end

def juggling str
  flags, sequence = str.split(' ').unzip
  flags.map! { |e| e == '0' ? '0' : '1' }
  sequence.map! { |e| e.length }
  flags.zip(sequence)
       .map { |val, times| val * times }
       .join
       .to_i(2)
end

$stdin.each_line { |line| puts juggling(line) }