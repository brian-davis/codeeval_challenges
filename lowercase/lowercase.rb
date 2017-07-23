# re-implement String#downcase
def solution line
  l = *'a'..'z'
  u = *'A'..'Z'
  line.chars.map { |c| u.include?(c) ? l[u.index c] : c }.join
end

def init file
  IO.readlines(file).each { |line| puts solution line }
end

init ARGV[0]
