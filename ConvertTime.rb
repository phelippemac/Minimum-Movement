# Challange Link = https://www.hackerrank.com/challenges/time-conversion/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign
# !/bin/ruby

#
# Complete the timeConversion function below.
#
def timeConversion(s)
  hs = s[0..1].to_i
  case s[-2..-1]
  when 'PM'
    hs += 12 if hs < 12
    hs == 24 ? hs = '00' : hs
  when 'AM'
    hs == 12 ? hs = '00' : hs = "0#{hs}"
  end
  "#{hs}#{s[2..7]}"
end
