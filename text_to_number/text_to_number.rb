# TEXT TO NUMBER
# CHALLENGE DESCRIPTION:

# You have a sting which contains a number represented as English text. Your task is to translate these numbers into their integer representation. The numbers can range from negative 999,999,999 to positive 999,999,999. The following is an exhaustive list of English words that your program must account for:

# negative,
# zero, one, two, three, four, five, six, seven, eight, nine,
# ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen,
# twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety,
# hundred,
# thousand,
# million
# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following

# fifteen
# negative six hundred thirty eight
# zero
# two million one hundred seven
# - Negative numbers will be preceded by the word negative. 
# - The word "hundred" is not used when "thousand" could be. E.g. 1500 is written "one thousand five hundred", not "fifteen hundred".

# OUTPUT SAMPLE:

# Print results in the following way.

# 15
# -638
# 0
# 2000107
def solution(string)
  vocab = {
    'zero' => 0,
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10,
    'eleven' => 11,
    'twelve' => 12,
    'thirteen' => 13,
    'fourteen' => 14,
    'fifteen' => 15,
    'sixteen' => 16,
    'seventeen' => 17,
    'eighteen' => 18,
    'nineteen' => 19,
    'twenty' => 20,
    'thirty' => 30,
    'forty' => 40,
    'fifty' => 50,
    'sixty' => 60,
    'seventy' => 70,
    'eighty' => 80,
    'ninety' => 90,
    'hundred' => 100,
    'thousand' => 1000,
    'million' => 1000000
  }
  words = string.split(' ')
  negative = false
  millions_sum = 0
  thousands_sum = 0
  hundreds_sum = 0
  value = 0

  if words[0] == 'negative'
    negative = true
    words.shift
  end

  values = words.map{|w| vocab[w]}
  if values.include?(1000000)
    millions = values.shift(values.index(1000000)+1)
    millions_sum = sum(millions[0..-2]) * 1000000
  end

  if values.include?(1000)
    thousands = values.shift(values.index(1000)+1)
    thousands_sum = sum(thousands[0..-2]) * 1000
  end

  hundreds_sum = sum(values)

  final_value = millions_sum + thousands_sum + hundreds_sum
  final_value *= -1 if negative == true
  final_value
end

def sum(values)
  values.each_index do |i|
    if (values[i] == 100)
      values[i] *= values[i-1]
      values.delete_at(i-1)
    end
  end
  value = values.inject(0){|sum,x| sum + x}
end

def init(file)
  lines = IO.readlines(file)
  lines.each do |line|
   puts solution line
  end
end

init(ARGV[0])