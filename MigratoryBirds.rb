# Challange Link = https://www.hackerrank.com/challenges/migratory-birds/problem
# !/bin/ruby

require 'json'
require 'stringio'

# Complete the migratoryBirds function below.
def migratoryBirds(arr)
  birds = Hash.new(0)
  arr.each do |bir|
    birds.key?(bir) ? birds[bir] += 1 : birds[bir] = 1
  end
  max = birds.max_by { |_key, value| value }.last
  birds.sort_by { |key, _value| key }
       .select { |_key, value| value == max }
       .first
       .first
end
