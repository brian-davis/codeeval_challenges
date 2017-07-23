def solution line
  min, max = line.split(',').map { |x| x.to_i }
  (1..max).each_with_object([]) do |n, a|
    a << n if a.select { |i| n % i == 0 }.size < 2
  end.select{ |x| x >= min }.size
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]