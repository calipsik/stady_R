puts 'Введите значение для первой стороны треугольника'
a = gets.chomp.to_i

puts 'Введите значение для второй стороны треугольника'
b = gets.chomp.to_i

puts 'Введите значение для третьей стороны треугольника'
c = gets.chomp.to_i

if a**2 + b**2 == c**2 || b**2 + c**2 == a**2 || a**2 + c**2 == b**2
  puts "Треугольник с такими сторонами является прямоугольным"

elsif a == b && b == c
  puts "Треугольник с такими сторонами является равносторонним"
elsif a == b || a == c || b == c
  puts "Треугольник с такими сторонами является равнобедренным"
else
  puts "Треугольник с такими сторонами не является прямоугольным, равносторонним или равнобедренным"
end
