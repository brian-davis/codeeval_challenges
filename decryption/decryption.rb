# DECRYPTION
# SPONSORING COMPANY:
# CHALLENGE DESCRIPTION:

# For this challenge you are given an encrypted message and a key. You have to determine the encryption and encoding technique and then print out the corresponding plaintext message. You can assume that the plaintext corresponding to this message, and all messages you must handle, will be comprised of only the characters A-Z and spaces; no digits or punctuation.

# INPUT SAMPLE:

# There is no input for this program. The encrypted message and key is:

# message: "012222 1114142503 0313012513 03141418192102 0113 2419182119021713 06131715070119",
# keyed_alphabet: "BHISOECRTMGWYVALUZDNFJKPQX"
# OUTPUT SAMPLE:

# Print out the plaintext message. (in CAPS)
def solution
  encrypted      = '012222 1114142503 0313012513 03141418192102 ' \
                   '0113 2419182119021713 06131715070119'
  keyed_alphabet = 'BHISOECRTMGWYVALUZDNFJKPQX'
  alphabet       = [*'A'..'Z'].join
  encrypted.split(' ').map do |w|
    w.chars.each_slice(2).to_a
     .map { |nn| nn.join.to_i }
     .map { |n| alphabet[keyed_alphabet.index(alphabet[n])] }
     .join
  end.join(' ')
end
puts solution