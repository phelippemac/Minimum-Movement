# Challange Link = https://www.hackerrank.com/challenges/diagonal-difference/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

# !/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def diagonalDifference(arr)
  a = 0
  b = 0
  arr.each_with_index do |v, ind|
    aux = 0
    v.each do |value|
      a += value if ind == aux
      b += value if aux == (arr.size - 1) - ind
      aux += 1
    end
  end
  (a - b).negative? ? b - a : a - b
end
