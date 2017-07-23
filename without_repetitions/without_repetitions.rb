# WITHOUT REPETITIONS
# CHALLENGE DESCRIPTION:

# In a given text, if there are two or more identical characters in sequence, delete the repetitions and leave only the first character.

# For example:

# Shellless mollusk lives in wallless house in wellness. Aaaarrghh!

# ↓

# Sheles molusk lives in wales house in welnes. Aargh!
# INPUT SAMPLE:

# The first argument is a file. The file contains a text.

# For example:

# But as he spake he drew the good sword from its scabbard, and
# smote a heathen knight, Jusssstin of thee Iron Valley.
# No matttter whom you choose, she deccccclared, I will abide by
# your decision.
# Wwwhat is your will?
# At his magic speech the ground oppened and he began the path of
# descent.
# I should fly away and you would never see me again.
# OUTPUT SAMPLE:

# Print to stdout the text in which all repetitions are deleted.

# For example:

# But as he spake he drew the god sword from its scabard, and smote
# a heathen knight, Justin of the Iron Valey.
# No mater whom you chose, she declared, I wil abide by your
# decision.
# Wwhat is your wil?
# At his magic spech the ground opened and he began the path of
# descent.
# I should fly away and you would never se me again.
# CONSTRAINTS:

# The text is case-sensitive: ‘a’ and ‘A’ are different characters.
# The input consists of 40 text lines.
# The maximum size of the text is 10 KB.


class Array
  def delete_at_indices *indices
    r = each.with_index.with_object([]) do |(e, i), a|
      a << e if indices.include? i
    end
    delete_if.with_index { |_, i| indices.include? i }
    r
  end

  def repeated_indices
    each.with_index.with_object([]) do |(e, i), a|
      next if i == 0
      a << i if e == self[i - 1]
    end
  end

  def delete_repeated
    delete_at_indices(*self.repeated_indices)
  end
end

def without_repetition str
  c = str.chars.to_a
  c.delete_repeated
  c.join
end

$stdin.each_line { |line| puts without_repetition line }