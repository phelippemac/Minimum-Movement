#!/bin/ruby

require 'json'
require 'stringio'
require 'benchmark'
# Complete the circularArrayRotation function below.
def circularArrayRotation(a, k, queries)
  res = []
  b = a
  b = circle2(b, k)
  queries.each do |x|
    res << b[x]
  end
  p res
end

def circle(arr)
  res = Array.new(0)
  res.insert(0, arr.last)
  res += arr
  res.pop
  res
end

def circle2(arr, adv)
  res = Array.new(0)
  aux = adv
  arr.each do |v|
    p v
    res[aux] = v
    aux += 1
  end
  res.insert(0, arr.last)
  res.pop
  p "Tamanho da Array = #{arr.size}"
  p "Tamanho da nova array Array = #{res.size}"
  p sobra = res[arr.size..res.size]
  p res[0..arr.size-1]
  p res.compact.insert(1, sobra).flatten

end
a = Array.new(0)
10.times do
  a << Random.rand(100_000)
end

circularArrayRotation(a, 4, [0, 1, 2])

#b = Array.new(0)
#c = Array.new(0)
#100_000.times do
#  a << Random.rand(50)
#end
#500_000.times do
#  b << Random.rand(500)
#end
#1_000_000.times do
#  c << Random.rand(5000)
#end

#Benchmark.bm do |x|
# x.report { circularArrayRotation(a, 8, [0, 1, 2]) }
#  x.report { circularArrayRotation(b, 500, [0, 1, 2]) }
#  x.report { circularArrayRotation(c, 500, [0, 1, 2]) }
#end