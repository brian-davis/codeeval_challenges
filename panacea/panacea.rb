# PANACEA - TRUTH OR LIE
# CHALLENGE DESCRIPTION:

# There are many computer and human viruses nowadays. Scientists are scratching their heads over antiviruses that could stop a particular virus and, in most cases, they find right solutions. 
# So, virologists need to know which antiviruses can protect us from viruses, and what they still have to work on to secure against the remaining viruses. Let’s help them out!

# INPUT SAMPLE:

# The first argument is a path to a file. Each line includes a test case with virus components in the hexadecimal numeral system (HEX) and antivirus components in the binary number system (BIN). Virus and antivirus components are separated by a pipeline '|'.

# 64 6e 78 | 100101100 11110
# 5e 7d 59 | 1101100 10010101 1100111
# 93 75 | 1000111 1011010 1100010
# OUTPUT SAMPLE:

# Your task is to calculate the sum of all virus components and compare it with the sum of antivirus components. If the numbers are the same or the sum of antivirus components is greater than the sum of virus components, this means that the virus was stopped. So, print True. Otherwise, print False.

# True
# True
# False
# CONSTRAINTS:

# The sum of components can be from 60 to 1500.
# The number of components in virus and antivirus can be from 1 to 8.
# The number of test cases is 40.

File.open(ARGV[0]).each_line do |line|
  hex, binary = line.split("|")
  hex = hex.split(" ")
  virus = hex.map { |e| e.to_i(16) }.reduce(0) {|sum, e| sum + e}
  binary = binary.split(" ")
  antivirus = binary.map { |e| e.to_i(2) }.reduce(0) { |sum, e| sum + e }
  r = antivirus >= virus ? "True" : "False"
  puts r
end