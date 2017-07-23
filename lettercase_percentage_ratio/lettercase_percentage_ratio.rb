# LETTERCASE PERCENTAGE RATIO
# CHALLENGE DESCRIPTION:


# Your task is to write a program which determines (calculates) the percentage ratio of lowercase and uppercase letters.

# INPUT SAMPLE:

# Your program should accept a file as its first argument. Each line of input contains a string with uppercase and lowercase letters.

# For example:

# thisTHIS
# AAbbCCDDEE
# N
# UkJ
# OUTPUT SAMPLE:

# For each line of input, print the percentage ratio of uppercase and lowercase letters rounded to the second digit after the point.

# For example:

# lowercase: 50.00 uppercase: 50.00
# lowercase: 20.00 uppercase: 80.00
# lowercase: 0.00 uppercase: 100.00
# lowercase: 33.33 uppercase: 66.67

def solution s
  lc, uc = [/[a-z]/, /[A-Z]/].map { |r| s.scan(r).size.to_f / s.length * 100 }
  "lowercase: #{format '%.2f', lc} uppercase: #{format '%.2f', uc}"
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]