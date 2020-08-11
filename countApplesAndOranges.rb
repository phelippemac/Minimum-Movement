# Challange link = https://www.hackerrank.com/challenges/apple-and-orange/problem
require 'json'
require 'stringio'

# Complete the countApplesAndOranges function below.
def countApplesAndOranges(start_point, ending_point, apple_tree,
                          orange_tree, apples, oranges)
  fallen_a = Array.new(0)
  fallen_o = Array.new(0)
  v = start_point..ending_point
  apples.each do |a|
    fallen_a << a if v.include?(apple_tree + a)
  end
  oranges.each do |o|
    fallen_o << o if v.include?(orange_tree + o)
  end
  p fallen_a.size
  p fallen_o.size
end
