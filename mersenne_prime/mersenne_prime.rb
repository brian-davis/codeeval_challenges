# MERSENNE PRIME
# CHALLENGE DESCRIPTION:

# In January 2013, GIMPS contributors discovered the 48th known Mersenne prime number. For this, they received a $100,000 award. A newly announced $150,000 reward will be given to those who will discover the next largest known prime. 
# Do not want to get it? We offer this challenge to you to get ready.

# INPUT SAMPLE:

# The first argument is a path to a file. Each line includes a test case with an integer.

# 4
# 308
# OUTPUT SAMPLE:

# Your task is to print all Mersenne numbers that are smaller than the number in a test case. Separate those numbers by commas.

# 3
# 3, 7, 31, 127
# CONSTRAINTS:

# The number in a test case can be from 4 to 3,000.
# The number of test cases is 20.


# def primes(n)
#   known_primes = []
#   (1..n).each do |i|
#     count = 0
#     known_primes.each do |j|
#       if count == 0 && j != 1 && j != i
#         # puts "#{i} % #{j}: #{i % j}"
#         count += 1 if j = 1 && i % j == 0
#       end
#     end
#     # puts "#{i} count: #{count}"
#     known_primes << i if count == 0
#   end
#   known_primes
# end

# # puts primes(100).join(", ")

# https://www.mersenne.org/
# # 3, 7, 31, 127
# # Mn = 2^n − 1
def mersenne_primes(n)
  known_mersennes = []
  known_primes = []
  (1..n).each do |i|
    count = 0
    known_primes.each do |j|
      if count == 0 && j != 1 && j != i
        count += 1 if j = 1 && i % j == 0
      end
    end
    if count == 0
      known_primes << i 
      mersenne = (2 ** i) - 1
      known_mersennes << mersenne
    end
    break if known_mersennes.last >= n
  end
  known_mersennes.select { |p| p != 1 && p < n }
end
# puts mersenne_primes(3000).join(", ")
File.open(ARGV[0]).each_line do |line|
  n = line.to_i
  puts mersenne_primes(n).join(", ")
end

