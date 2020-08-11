# Challange Link = https://www.hackerrank.com/challenges/kangaroo/problem
#!/bin/ruby

require 'json'
require 'stringio'

# Complete the kangaroo function below.
def kangaroo(x1, v1, x2, v2)
  return 'NO' if (x2 > x1 && v2 > v1) || (x1 > x2 && v1 > v2)

  jump1 = Array.new(0)
  jump2 = Array.new(0)
  (x2 - x1).times do
    retunr 'YES' if x1 + v1 == x2 + v2
  end
  p jump1 & jump2
  p(jump1 & jump2).empty? ? 'NO' : 'YES'
end
