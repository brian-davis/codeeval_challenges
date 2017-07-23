# HEX TO DECIMAL
# CHALLENGE DESCRIPTION:


# You will be given a hexadecimal (base 16) number. Convert it into decimal (base 10).

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains a hex number. You may assume that the hex number does not have the leading 'Ox'. Also all alpha characters (a through f) in the input will be in lowercase. E.g.

# 9f
# 11
# OUTPUT SAMPLE:

# Print out the equivalent decimal number. E.g.

# 159
# 17
def solution hex_str
  # # built-in
  # hex_str.hex

  # re-implemented
  hex_table = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  hex_str.downcase
         .scan(/[0-9a-f]/)
         .reverse
         .map
         .with_index { |x, i| hex_table.index(x) * 16**i }
         .reduce :+
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
