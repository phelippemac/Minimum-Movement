# Challange link = https://www.hackerrank.com/challenges/the-birthday-bar/problem

require 'json'
require 'stringio'

# Complete the birthday function below.
def birthday(s, d, m)
  slices = []
  s.each_index do |i|
    val = 0
    m.times do |part|
      next if s[i + part].nil?

      val += s[i + part]
    end
    slices << val
  end
  p slices.map! {|x| x == d ? x : next}.compact.size
end
