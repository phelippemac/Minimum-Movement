# Chalange Link = https://www.hackerrank.com/challenges/picking-numbers/problem
#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'pickingNumbers' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def pickingNumbers(a)
  types = Hash.new(0)
  a.sort.each do |v|
    types[v] += 1
  end
  next_value = []
  types.each do |key, value|
    types.each do |key2, value2|
      next_value << value if key == key2
      next if key == key2

      check = key.to_i - key2.to_i
      check.negative? ? check *= -1 : check
      next_value << value + value2 if check <= 1
    end
  end
  return a.size if next_value.empty?

  p next_value.max
end

a = %w[66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66]
pickingNumbers(a)

b = %w[4 97 5 97 97 4 97 4 97 97 97 97 4 4 5 5 97 5 97 99 4 97 5 97 97 97 5 5 97 4 5 97 97 5 97 4 97 5 4 4 97 5 5 5 4 97 97 4 97 5 4 4 97 97 97 5 5 97 4 97 97 5 4 97 97 4 97 97 97 5 4 4 97 4 4 97 5 97 97 97 97 4 97 5 97 5 4 97 4 5 97 97 5 97 5 97 5 97 97 97]
pickingNumbers(b)

c = %w(4 6 5 3 3 1)

pickingNumbers(c)