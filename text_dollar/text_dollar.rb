# TEXT DOLLAR
# CHALLENGE DESCRIPTION:

# Credits: This challenge has been authored by Terence Rudkin

# You are given a positive integer number. This represents the sales made that day in your department store. The payables department however, needs this printed out in english. NOTE: The correct spelling of 40 is Forty. (NOT Fourty)

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename.The input file contains several lines. Each line is one test case. Each line contains a positive integer. E.g.

# 3
# 10
# 21
# 466
# 1234
# OUTPUT SAMPLE:

# For each set of input produce a single line of output which is the english textual representation of that integer. The output should be unspaced and in Camelcase. Always assume plural quantities. You can also assume that the numbers are < 1000000000 (1 billion). In case of ambiguities e.g. 2200 could be TwoThousandTwoHundredDollars or TwentyTwoHundredDollars, always choose the representation with the larger base i.e. TwoThousandTwoHundredDollars. For the examples shown above, the answer would be:

# ThreeDollars
# TenDollars
# TwentyOneDollars
# FourHundredSixtySixDollars
# OneThousandTwoHundredThirtyFourDollars

class ConvertNum
  VOCAB = { 'Zero' => 0, 'One' => 1, 'Two' => 2, 'Three' => 3, 'Four' => 4,
            'Five' => 5, 'Six' => 6, 'Seven' => 7, 'Eight' => 8, 'Nine' => 9,
            'Ten' => 10, 'Eleven' => 11, 'Twelve' => 12, 'Thirteen' => 13,
            'Fourteen' => 14, 'Fifteen' => 15, 'Sixteen' => 16,
            'Seventeen' => 17, 'Eighteen' => 18, 'Nineteen' => 19,
            'Twenty' => 20, 'Thirty' => 30, 'Forty' => 40, 'Fifty' => 50,
            'Sixty' => 60, 'Seventy' => 70, 'Eighty' => 80, 'Ninety' => 90,
            'Hundred' => 100, 'Thousand' => 1_000, 'Million' => 1_000_000 }

  def self.solution n
    new.solution n
  end

  def solution n
    word = ''
    parts = n.to_s.chars.to_a.reverse.each_slice(3).map { |x| x.reverse.join.to_i }
    hundreds, thousands, millions = parts[0], parts[1], parts[2]
    word << "#{hundreds(millions)}Million" if millions
    word << "#{hundreds(thousands)}Thousand" if (thousands && thousands > 0)
    word << "#{hundreds(hundreds)}"
    word << 'Dollars'
  end

  private

  def hundreds n
    return '' if n == 0
    closest = VOCAB.values.sort.reverse.find { |x| x <= n }
    times, mod = n.divmod closest
    times_w, w, new_w = VOCAB.key(times), VOCAB.key(closest), hundreds(mod)
    w == 'Hundred' ? (times_w + w + new_w) : (w + new_w)
  end
end

def init file
  IO.readlines(file).each { |line| puts ConvertNum.solution line.chomp.to_i }
end

init ARGV[0]
