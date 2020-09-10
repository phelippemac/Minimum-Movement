# V 1.0

def rot13(secret_messages)
  secret_messages.map{|x| dictionarie(x)}
end

def dictionarie(letters)
  word = ""
  d = [
    ["A", "N"], ["B", "O"], ["C", "P"], ["D", "Q"],
    ["E", "R"], ["F", "S"], ["G", "T"], ["H", "U"],
    ["I", "V"], ["J", "W"], ["K", "X"], ["L", "Y"],
    ["M", "Z"], 
    ["a", "n"], ["b", "o"], ["c", "p"], ["d", "q"],
    ["e", "r"], ["f", "s"], ["g", "t"], ["h", "u"],
    ["i", "v"], ["j", "w"], ["k", "x"], ["l", "y"],
    ["m", "z"],
    [" ", " "]
    ]
  letters.each_char do |l|
    d.each do |c|
      if c.include?(l)
        l == c[0] ? word += c[1] : word += c[0]
      end
    end
  end
  word
end