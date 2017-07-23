# VALID PARENTHESES
# CHALLENGE DESCRIPTION:


# Given a string comprising just of the characters (,),{,},[,] determine if it is well-formed or not.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line in this file contains a string comprising of the characters mentioned above. E.g.

# ()
# ([)]
# OUTPUT SAMPLE:

# Print out True or False if the string is well-formed. E.g.

# True
# False

def valid_parentheses? str
  return false if str.length <= 1
  pairs = { '{' => '}', '[' => ']', '(' => ')' }
  str.match /([\[\(\{]+)([^\[\(\{\]\)\}]+)*([\]\)\}]+)/
  begin
    $1.chars.map { |c| pairs[c] }.join.reverse == $3
  rescue
    false
  end
end

$stdin.read.split("\n").each do |line|
  puts valid_parentheses?(line) ? 'True' : 'False'
end