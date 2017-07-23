def solution line
  n, p1, p2 = line.split(',').map { |x| x.to_i }
  n[(p1 - 1)] == n[(p2 - 1)]
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init(ARGV[0])
