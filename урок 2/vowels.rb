alphabet = ('a'..'z').to_a
vowes_alphabet = ["a", "e", "i", "o", "u", "y"]
vowes = {}
alphabet.each_with_index do |l, i|
  vowes[l] = i+1 if vowes_alphabet.include?(l)
end
puts vowes