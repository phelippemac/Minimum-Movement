# Challange Link = https://www.hackerrank.com/challenges/counting-valleys/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=warmup
# !/bin/ruby

require 'json'
require 'stringio'

# Complete the countingValleys function below.
def countingValleys(_n, s)
  val = 0
  valley = [false]
  s.split('').map do |c|
    c == 'U' ? 1 : -1
  end.each do |v|
    val += v
    if val.negative? && valley.last == false
      valley << 1
      valley << true
    elsif val.negative? && valley.last == true
      valley << true
    else
      valley << false
    end
  end
  valley
    .reject! { |x| x == false }
    .reject! { |x| x == true }
  p valley.empty? ? 0 : valley.inject(0) { |sum, x| sum + x }
end
countingValleys(10, 'UDUUUDUDDD') # 0
