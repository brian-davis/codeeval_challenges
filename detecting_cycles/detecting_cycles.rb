def solution line
  arr = line.split ' '
  1.upto arr.length / 2 do |i|
    a = arr.dup
    chunk = a.pop i
    next_chunk = a.last i
    return next_chunk.join ' ' if next_chunk == chunk
  end
end

def init file
  IO.readlines(file).each { |line| puts solution line.chomp }
end

init ARGV[0] 