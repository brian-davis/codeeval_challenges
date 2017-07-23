def solution line
  long_string, test_string = line.split ','
  long_string.split('').last(test_string.length).join == test_string ? 1 : 0
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
