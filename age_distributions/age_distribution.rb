# AGE DISTRIBUTION
# CHALLENGE DESCRIPTION:

# You're responsible for providing a demographic report for your local school district based on age. To do this, you're going determine which 'category' each person fits into based on their age.
# The person's age will determine which category they should be in:

# If they're from 0 to 2 the child should be with parents print : 'Still in Mama's arms'
# If they're 3 or 4 and should be in preschool print : 'Preschool Maniac'
# If they're from 5 to 11 and should be in elementary school print : 'Elementary school'
# From 12 to 14: 'Middle school'
# From 15 to 18: 'High school'
# From 19 to 22: 'College'
# From 23 to 65: 'Working for the man'
# From 66 to 100: 'The Golden Years'
# If the age of the person less than 0 or more than 100 - it might be an alien - print: "This program is for humans"
# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. Each line of input contains one integer - age of the person:

# 0
# 19
# OUTPUT SAMPLE:

# For each line of input print out where the person is:

# Still in Mama's arms
# College


def age_distribution age
  case
  when age.between?(0, 2) then "Still in Mama's arms"
  when age.between?(3, 4) then "Preschool Maniac"
  when age.between?(5, 11) then "Elementary school"
  when age.between?(12, 14) then "Middle school"
  when age.between?(15, 18) then "High school"
  when age.between?(19, 22) then "College"
  when age.between?(23, 65) then "Working for the man"
  when age.between?(66, 100) then "The Golden Years"
  when age < 0 || age > 100 then "This program is for humans"
  end
end

$stdin.each_line { |line| puts age_distribution(line.to_i) }
