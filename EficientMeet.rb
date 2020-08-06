require 'set'

def fill_meeting_days(firstDays, lastDays)
  # Store each filled day as the key of a Hash. We don't care what the
  # value is. This is better done as a Set.
  meeting_days = {}

  # Iterate through the index of firstDays so we can iterate through
  # firstDays and lastDays in parallel. Normally this is done with #zip.
  firstDays.each_index do |i|
    # Get the first and last day.
    firstDay = firstDays[i]
    lastDay = lastDays[i]

    # Iterate from the firstDay to the lastDay.
    (firstDay..lastDay).each do |day|
      # Add them to the first empty day.
      next if meeting_days[day]

      # Add them.
      meeting_days[day] = 1
      # We added them, stop looking.
      break
    end
  end

  meeting_days.size
end

p fill_meeting_days(
  [1, 2, 3, 3, 3], [2, 2, 3, 4, 4]
)
