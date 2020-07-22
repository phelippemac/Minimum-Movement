require 'net/http'
require 'date'
#
# Complete the 'getUserTransaction' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER uid
#  2. STRING txnType
#  3. STRING monthYear
#
#  https://jsonmock.hackerrank.com/api/transactions/search?txnType=
#

def getUserTransaction(uid, txnType, monthYear)
  url = 'https://jsonmock.hackerrank.com/api/transactions/search'
  resp = Net::HTTP.get_response(URI.parse(url))
  all_records = []
  deb_records = []
  data = JSON.parse(resp.body)
  (1..data['total_pages']).step do |page|
    url = "https://jsonmock.hackerrank.com/api/transactions/search?&userId=#{uid}&page=#{page}"
    resp = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(resp.body)['data'].each do |x|
      if (x['userId'] == uid && utc_mili_to_date(x['timestamp']) == monthYear) && x['txnType'] == txnType
        all_records << x
        end
      deb_records << x if x['userId'] == uid && utc_mili_to_date(x['timestamp']) == monthYear && x['txnType'] == 'debit'
    end
  end
  # Variable to hold a value referenced by
  total_average = 0.0
  debit_average = 0.0
  result = []
  all_records.each { |am| total_average += to_money(am['amount']) }
  deb_records.each { |am| debit_average += to_money(am['amount']) }

  all_records.each { |r| puts r }
  total_average = (total_average / all_records.size).floor(2)
  debit_average = (debit_average / deb_records.size).floor(2)
  debit_average = 0 if deb_records.empty?
  p "Total = #{debit_average}"
  p "debit_average = #{debit_average}"
  if debit_average.zero?
    [-1]
  else
    all_records.each { |v| result << v['id'] if to_money(v['amount']) > debit_average }
    p result
    result.empty? ? [-1] : result.sort
  end
end

def to_money(string)
  string[1..-1].tr(',', '').to_f
end

def utc_mili_to_date(utc)
  Time.at(utc / 1000).strftime('%m-%Y')
end
