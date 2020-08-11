# Challange Link = https://www.hackerrank.com/challenges/grading/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

# !/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'gradingStudents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.
#

def gradingStudents(grades)
  res = []
  grades.each do |g|
    if g < 38
      res << g
      next
    end
    res << (next_mod_5(g) - g < 3 ? next_mod_5(g) : g)
  end
  res
end

def next_mod_5(num)
  aux = 0
  aux += 1 while (num + aux) % 5 != 0
  num + aux
end