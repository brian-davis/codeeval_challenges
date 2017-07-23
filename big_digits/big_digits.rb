# BIG DIGITS
# CHALLENGE DESCRIPTION:

# In this challenge you're presented with a situation in which you need to output big symbols on devices which only support ASCII characters and single, fixed-width fonts. To do this you're going to use pseudo-graphics to ‘draw’ these big symbols.

# Here is an example of the font with digits from 0 to 9:


# 6
# -**----*--***--***---*---****--**--****--**---**--
# *--*--**-----*----*-*--*-*----*-------*-*--*-*--*-
# *--*---*---**---**--****-***--***----*---**---***-
# *--*---*--*-------*----*----*-*--*--*---*--*----*-
# -**---***-****-***-----*-***---**---*----**---**--
# --------------------------------------------------
# Each pixel is marked either with asterisk ‘*’ or with minus ‘-’. Size of a digit is 5×6 pixels.

# Your task is to write a program, which outputs the numbers given to you with the font as in the example.

# INPUT SAMPLE:

# The first argument is a file that contains the lines with digits sequences you need to magnify. E.g.:


# 3.1415926
# 1.41421356
# 01-01-1970
# 2.7182818284
# 4 8 15 16 23 42
# OUTPUT SAMPLE:

# Print to stdout the magnified digits:


# 6
# 7
# 8
# 9
# 10
# 11
# 12
# 13
# 14
# 15
# 16
# 17
# 18
# 19
# 20
# 21
# 22
# 23
# 24
# 25
# 26
# 27
# 28
# 29
# 30
# ***----*---*-----*--****--**--***---**--
# ---*--**--*--*--**--*----*--*----*-*----
# -**----*--****---*--***---***--**--***--
# ---*---*-----*---*-----*----*-*----*--*-
# ***---***----*--***-***---**--****--**--
# ----------------------------------------
# --*---*-----*---*---***----*--***--****--**--
# -**--*--*--**--*--*----*--**-----*-*----*----
# --*--****---*--****--**----*---**--***--***--
# --*-----*---*-----*-*------*-----*----*-*--*-
# -***----*--***----*-****--***-***--***---**--
# ---------------------------------------------
# -**----*---**----*----*---**--****--**--
# *--*--**--*--*--**---**--*--*----*-*--*-
# *--*---*--*--*---*----*---***---*--*--*-
# *--*---*--*--*---*----*-----*--*---*--*-
# -**---***--**---***--***--**---*----**--
# ----------------------------------------
# ***--****---*---**--***---**----*---**--***---**---*---
# ---*----*--**--*--*----*-*--*--**--*--*----*-*--*-*--*-
# -**----*----*---**---**---**----*---**---**---**--****-
# *-----*-----*--*--*-*----*--*---*--*--*-*----*--*----*-
# ****--*----***--**--****--**---***--**--****--**-----*-
# -------------------------------------------------------
# -*----**----*--****---*---**--***--***---*---***--
# *--*-*--*--**--*-----**--*-------*----*-*--*----*-
# ****--**----*--***----*--***---**---**--****--**--
# ---*-*--*---*-----*---*--*--*-*-------*----*-*----
# ---*--**---***-***---***--**--****-***-----*-****-
# --------------------------------------------------
# CONSTRAINTS:

# Input lines are up to 16 symbols long.
# Input can contain some other symbols, which should be ignored (i.e. points, hyphens, spaces); only numbers must be printed out.

class BigFont
  ONE = <<-EOF
--*--
-**--
--*--
--*--
-***-
-----
EOF

  TWO = <<-EOF
***--
---*-
-**--
*----
****-
-----
EOF

  THREE = <<-EOF
***--
---*-
-**--
---*-
***--
-----
EOF

  FOUR = <<-EOF
-*---
*--*-
****-
---*-
---*-
-----
EOF

  FIVE = <<-EOF
****-
*----
***--
---*-
***--
-----
EOF

  SIX = <<-EOF
-**--
*----
***--
*--*-
-**--
-----
EOF

  SEVEN = <<-EOF
****-
---*-
--*--
-*---
-*---
-----
EOF

  EIGHT = <<-EOF
-**--
*--*-
-**--
*--*-
-**--
-----
EOF

  NINE = <<-EOF
-**--
*--*-
-***-
---*-
-**--
-----
EOF

  ZERO = <<-EOF
-**--
*--*-
*--*-
*--*-
-**--
-----
EOF

  LOOKUP = { '0' => 'ZERO',
             '1' => 'ONE',
             '2' => 'TWO',
             '3' => 'THREE',
             '4' => 'FOUR',
             '5' => 'FIVE',
             '6' => 'SIX',
             '7' => 'SEVEN',
             '8' => 'EIGHT',
             '9' => 'NINE' }

  attr_reader :original

  def initialize str
    @original = str
  end

  def display
    chars = original.chars.select { |c| c =~ /[0-9]/ }
    bigs = chars.map { |c| BigFont.const_get(LOOKUP[c]) }
    bigs_arrs = bigs.map { |b| b.split("\n") }.transpose.map { |e| e.join }.join("\n")
  end
end

$stdin.read.split("\n").each { |line| puts BigFont.new(line).display }
