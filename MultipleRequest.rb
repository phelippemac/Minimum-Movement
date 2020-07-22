# read the string filename
filename = gets.strip

file = File.open(filename)
file_data = file.readlines.map(&:chomp)

general_data = {}
file_data.map! { |i| i.split('[') }.each do |i|
  i.each_with_index do |i2, ind2|
    i.delete(i2) if ind2.zero? || ind2.even?
  end
end
file_data.each do |i|
  i = i.first.split(' -').first
  if general_data.key?(i)
    general_data[i] += 1
  else
    general_data[i] = 0
  end
end

File.open("req_#{filename}", 'w') do |f|
  general_data.each do |key, value|
    value.positive? ? f << "#{key}\n" : next
  end
end

# read the string filename
filename = gets.strip

file = File.open(filename)
file_data = file.readlines.map(&:chomp)

REG = %r{[0-9]{1,2}/[A-Z|a-z]{1,3}/[0-9]{4}.[0-9]{1,2}\:[0-9]{1,2}\:[0-9]{1,2}}.freeze

general_data = {}
file_data.each do |part|
  if general_data.key?(part[REG])
    general_data[part[REG]] += 1
  else
    general_data[part[REG]] = 0
    end
end

File.open("req_#{filename}", 'w') do |f|
  general_data.each do |key, value|
    value.positive? ? f << "#{key}\n" : next
  end
  f.close
end
