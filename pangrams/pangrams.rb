def solution line
  result = [*'a'..'z'] - line.downcase.chars.select { |c| /[a-z]/ =~ c }
  result.empty? ? 'NULL' : result.join
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0]
