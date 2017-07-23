# SIMPLE SORTING
# CHALLENGE DESCRIPTION:


# Write a program which sorts numbers.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# 70.920 -38.797 14.354 99.323 90.374 7.581
# -37.507 -3.263 40.079 27.999 65.213 -55.552
# OUTPUT SAMPLE:

# Print sorted numbers in the following way. Please note, that you need to print the numbers till the 3rd digit after the dot including trailing zeros.

# -38.797 7.581 14.354 70.920 90.374 99.323
# -55.552 -37.507 -3.263 27.999 40.079 65.213

def padding f
  pre, post = f.to_s.split('.')
  until post.length == 3
    post += '0'
  end
  "#{pre}.#{post}"
end

def simple_sorting str
  str.split(' ')
     .map { |e| e.to_f }
     .sort.map { |e| padding e }
     .join(' ')
end

$stdin.read.split("\n").each { |e| puts simple_sorting e }