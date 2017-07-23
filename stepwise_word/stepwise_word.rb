# STEPWISE WORD
# CHALLENGE DESCRIPTION:

# Print the longest word in a stepwise manner.

# INPUT SAMPLE:

# The first argument is a path to a file. Each line contains a test case with a list of words that have different or the same length.

# For example:

# cat dog hello
# stop football play
# music is my life
# OUTPUT SAMPLE:

# Find the longest word in each line and print it in one line in a stepwise manner. Separate each new step with a space. If there are several words of the same length and they are the longest, then print the first word from the list.

# h *e **l ***l ****o
# f *o **o ***t ****b *****a ******l *******l
# m *u **s ***i ****c
# CONSTRAINTS:

# The word length is from 1 to 10 characters.
# The number of words in a line is from 5 to 15.
# If there are several words of the same length and they are the longest, then print the first word from the list.
# The number of test cases is 40.


File.open(ARGV[0]).each_line do |line|
  words = line.split(" ")
  lengths = words.map(&:length)
  max = lengths.max
  longest_index = lengths.index(max)
  longest_word = words[longest_index]
  puts longest_word.chars.map.with_index { |c,i| ("*" * i) + c }.join(" ")
end


# h *e **l ***l ****o
# f *o **o ***t ****b *****a ******l *******l
# m *u **s ***i ****c