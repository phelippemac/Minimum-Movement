require 'thread'
#
# Complete the 'countMeetings' function below.
#
# The function is expected to return an INTEGER.

# The function accepts following parameters:
#  1. INTEGER_ARRAY firstDay
#  2. INTEGER_ARRAY lastDay
#

def countMeetings(firstDay, lastDay)
  #GC::Profiler.enable
  #GC::Profiler.clear

  #Used Variables
  #@mutex = A tool to prevent a thread starts out of synchrony
  #@available = Possilbe days to attend the Investor
  #@investors = Array of investors
  #@threads = Array for allocate threads for reduce the time of execution
  #@meet = The maximun number of possible meetings 

  mutex = Mutex.new
  #Construct the available days for meetings
  available =* firstDay.first..lastDay.last
  investors = []
  #Construct a list of investor based in their first and last days
  firstDay.each_index do |i|
    investors << (firstDay[i]..lastDay[i]).to_a
  end

  meet = 0
  threads = []
  one_day_investor = []
  attended = []

  #Cut investors that will stay only for a day, and are repeated
  investors.each do |investor|
    if investor.size == 1
        one_day_investor << investor 
    end
  end
  p investors
  p one_day_investor = one_day_investor.uniq
  p investors - one_day_investor
  #Check if there are more investor than possible days to attend them
  return available.size if investors.size >= available.size
    investors.each_slice(10000) do |slice|
        slice.each do |investor_group|
            threads << Thread.new do 
                mutex.synchronize do
                    for investor in investor_group
                        if available.include?(investor)
                        meet += 1
                        attended << investor
                        available.delete(investor)
                        break
                        end
                    end
                end
            end
        end
    end
 
  threads.each{|t| t.join}
  p attended
  meet

end


def countMeetings(firstDay, lastDay)

    loop_size = firstDay.size
    first = firstDay.sort.first
    last = lastDay.sort.last

    daily_attendance = {}
   
    (first..last).each do |day|
        for ind in 0...loop_size
            (firstDay[ind]..lastDay[ind]).lazy.each do |investor_day|
                next if daily_attendance.has_value?(ind)
                if investor_day == day
                    daily_attendance[day] = ind
                end
            end
        end
    end

    daily_attendance.size
end
