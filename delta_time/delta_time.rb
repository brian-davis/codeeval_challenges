# DELTA TIME
# CHALLENGE DESCRIPTION:

# You are given the pairs of time values. The values are in the HH:MM:SS format with leading zeros. Your task is to find out the time difference between the pairs.

# INPUT SAMPLE:

# The first argument is a file that contains lines with the time pairs.

# For example:

# 14:01:57 12:47:11
# 13:09:42 22:16:15
# 08:08:06 08:38:28
# 23:35:07 02:49:59
# 14:31:45 14:46:56
# OUTPUT SAMPLE:

# Print to stdout the time difference for each pair, one per line. You must format the time values in HH:MM:SS with leading zeros.

# For example:

# 01:14:46
# 09:06:33
# 00:30:22
# 20:45:08
# 00:15:11


def delta_time a, b
  m, s = [a, b].map { |e| e.split(':').map(&:to_i ) }.sort
               .map { |e| Time.local(*([2015, 5, 25] + e)).to_i }
               .reverse.reduce(&:-).divmod(60)
  h, m = m.divmod(60)
  [h, m, s].map{ |n| n.to_s.rjust(2, '0') }.join(':')
end

$stdin.read.split("\n").each { |line| puts delta_time(*line.split(' '))}