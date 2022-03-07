backet = {}
result = 0
puts "Введите стоп что бы закончить подсчет"
loop do
  puts "Введите название товара"
  name = gets.chomp
  break if name == "stop"
  puts "Введите цену за 1 ед. товара"
  price = gets.chomp.to_f
  puts "Введите колличество покупаемого товара"
  count = gets.chomp.to_f
  backet[name] = {price => count}
end
backet.each do |name, price|
  puts "#{price.keys.first * price.values.first} за #{name}"
  result += price.keys.first * price.values.first
end
puts "Сумма всех товаров в корзине: #{result}"