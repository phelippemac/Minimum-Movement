# Challange Link = https://www.hackerrank.com/challenges/birthday-cake-candles/problem

require 'json'
require 'stringio'

# Complete the birthdayCakeCandles function below.
def birthdayCakeCandles(ar)
  candle_values = []
  max = ar.max
  ar.each do |c|
    candle_values << c if c >= max
  end
  candle_values.size
end
