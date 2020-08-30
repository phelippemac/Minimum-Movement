#!/bin/ruby

require 'json'
require 'stringio'

# Complete the catAndMouse function below.
def catAndMouse(x, y, z)
  dis1 = z - x
  dis2 = z - y
  p dis1
  p dis2
  dis1.negative? ? dis1 = dis1 * -1 : nil
  dis2.negative? ? dis2 = dis2 * -1 : nil
  if dis1 < dis2
    "Cat A"
  elsif dis2 < dis1
    "Cat B"
  else
    "Mouse C"
  end
end