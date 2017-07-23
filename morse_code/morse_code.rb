# MORSE CODE
# CHALLENGE DESCRIPTION:


# You have received a text encoded with Morse code and want to decode it.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Input example is the following:

# .- ...- ..--- .-- .... .. . -.-. -..-  ....- .....
# -... .... ...--
# Each letter is separated by space char, each word is separated by 2 space chars.

# OUTPUT SAMPLE:

# Print out decoded words. E.g.

# AV2WHIECX 45
# BH3
# You program has to support letters and digits only.
class MorseCode
  MORSE = { 'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.',
            'F' => '..-.', 'G' => '--.', 'H' => '....', 'I' => '..',
            'J' => '.---', 'K' => '-.-', 'L' => '.-..', 'M' => '--',
            'N' => '-.', 'O' => '---', 'P' => '.--.', 'Q' => '--.-',
            'R' => '.-.', 'S' => '...', 'T' => '-', 'U' => '..-',
            'V' => '...-', 'W' => '.--', 'X' => '-..-', 'Y' => '-.--',
            'Z' => '--..', '1' => '.----', '2' => '..---', '3' => '...--',
            '4' => '....-', '5' => '.....', '6' => '-....', '7' => '--...',
            '8' => '---..', '9' => '----.', '0' => '-----' }

  def self.decode str
    str.split('  ').each_with_object([]) do |e, a|
      a << e.split(' ').each_with_object([]) do |ee, aa|
        aa << MORSE.key(ee)
      end.join
    end.join(' ')
  end
end

def init file
  IO.readlines(file).each { |line| puts MorseCode.decode line.chomp }
end

init ARGV[0]
