# ROMAN NUMERALS
# CHALLENGE DESCRIPTION:


# Many persons are familiar with the Roman numerals for relatively small numbers. The symbols I (capital i), V, X, L, C, D, and M represent the decimal values 1, 5, 10, 50, 100, 500 and 1000 respectively. To represent other values, these symbols, and multiples where necessary, are concatenated, with the smaller-valued symbols written further to the right. For example, the number 3 is represented as III, and the value 73 is represented as LXXIII. The exceptions to this rule occur for numbers having units values of 4 or 9, and for tens values of 40 or 90. For these cases, the Roman numeral representations are IV (4), IX (9), XL (40), and XC (90). So the Roman numeral representations for 24, 39, 44, 49, and 94 are XXIV, XXXIX, XLIV, XLIX, and XCIV, respectively. 

# Write a program to convert a cardinal number to a Roman numeral.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# 159
# 296
# 3992
# Input numbers are in range [1, 3999]

# OUTPUT SAMPLE:

# Print out Roman numerals.

# CLIX
# CCXCVI
# MMMCMXCII
class RomanNumber
  RN = { "M" => 1000, "CM" => 900, "D" => 500, "CD" => 400, "C" => 100,
         "XC" => 90, "L" => 50, "XL" => 40, "X" => 10, "IX" => 9,
         "V" => 5, "IV" => 4, "I" => 1 }

  def self.to_roman n
    roman_letter, roman_val = RN.find {|k,v| v <= n }
    if roman_val == n
      roman_letter
    else
      q, m = n.divmod roman_val
      m == 0 ? (roman_letter * q) : (roman_letter * q) + to_roman(m)
    end unless n >= 4000
  end
end

def init file
  IO.readlines(file).each { |line| puts RomanNumber.to_roman line.chomp.to_i }
end

init ARGV[0]