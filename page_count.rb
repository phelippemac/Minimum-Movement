# Challange link : https://www.hackerrank.com/challenges/drawing-book/problem

def page_count(n, p)
  book = Hash.new(0)
  paper = [0]
  page = 1
  (1..n).each do |num|
    paper << num
    if paper.size == 2
      book["paper#{page}"] = paper
      paper = []
      page += 1
    elsif num == n
      book["paper#{page}"] = paper
    end
  end

  page_begin_to = search(book, p) - 1
  page_end_to = book.size - search(Hash[book.sort.reverse], p)

  if page_begin_to <= page_end_to
    p page_begin_to
  else
    p page_end_to
  end
end

def search(book, p)
  book.each do |k, v|
    return k.scan(/\d/).join('').to_i if v.include?(p)
  end
end

page_count(37_455, 29_835) # 3810
page_count(18_183, 18_042) # 70
page_count(15_603, 6957) # 3478
page_count(83_246, 78_132) # 2557
page_count(5, 4) # 0
page_count(6, 4) # 1
